
//
//  OtherCardsViewMOdel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift

protocol OtherCardsVieModelProtocol {
    func itemsCount(with section: Int) -> Int
    func sectionsCount() -> Int
    func getModel(with indexPath: IndexPath) -> OtherCardsModel
    func getArray() -> [OtherCardsModel]
    func updateModel(filtredModel: [OtherCardsModel])
    func sortingCards(text: String)
}
enum SearchType{
    case serchCard
    case allCards
}


class OtherCardsViewModel: OtherCardsVieModelProtocol{
    
    var modelSorted: [[OtherCardsModel]]!
    var otherCardModel = OtherCardsModel(){
        didSet{
            print("CHANGES!!!")
        }
    }
    var model: [OtherCardsModel] = []
    var decorator: ModelDecorator!
    
    func sectionsCount() -> Int {
        return modelSorted.count
    }
    
    
    func getArray() -> [OtherCardsModel] {
        return model
    }
    
    
    
    func itemsCount(with section: Int) -> Int {
        return modelSorted[section].count
    }
    
    func updateModel(filtredModel: [OtherCardsModel]){
        self.model = filtredModel
    }
    
    func getModel(with indexPath: IndexPath) -> OtherCardsModel{
        return modelSorted[indexPath.section][indexPath.row]
    }
    
    func sortingCards(text: String) {
//        var filtred: [OtherCardsModel] = []
        
//        filtred = model.filter({ (item) -> Bool in
//            let countryText: NSString = item.cardName as NSString
//            return (countryText.range(of: text, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
//        })
       let data = otherCardModel.fetchWithPredicate(text: text)
        var cards: [OtherCardsModel] = []
        data.forEach { (item) in
            let card = OtherCardsModel()
            card.cardId = item.cardId
            card.cardName = item.cardName
            card.category = item.category
            card.logoImage = UIImage(data: item.logoImage!)!
            cards.append(card)
        }
        modelSorted = decorator.mySorting(cards)
        
    }
    func prefetch() -> [CardsDataBase]{
        if let data = otherCardModel.fetchData(){
            return data
        } else {
            return []
        }
    }
    
    func fetch(){
        decorator = ModelDecorator()
        var cards = [OtherCardsModel]()
        if let items = otherCardModel.fetchData(){
            items.forEach { (card) in
                let oneCard = OtherCardsModel()
                oneCard.cardId = card.cardId
                oneCard.cardName = card.cardName
                oneCard.category = card.category
                oneCard.logoImage = UIImage(data: card.logoImage!)!
                cards.append(oneCard)
            }
        }
        self.model = cards
        modelSorted = decorator.mySorting(cards)
        
    }
    func getNotif(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(catchUpdate), name: NSNotification.Name(rawValue: "NewCartAdded"), object: nil)
    }
    
    @objc func catchUpdate (){
        fetch()
    }
    init() {
        fetch()
        getNotif()
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
