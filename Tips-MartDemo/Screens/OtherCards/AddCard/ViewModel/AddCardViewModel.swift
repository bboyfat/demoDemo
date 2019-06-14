//
//  AddCardViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/14/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol AddCardViewModelProtocol: class {
    func itemsCount(with section: Int) -> Int
    func sectionsCount() -> Int
    func titleForeHeader(with section: Int) -> String
     func getModel(withIndexPath: IndexPath) -> AddCardModel
}

class AddCardViewModel: AddCardViewModelProtocol{
  
    var model: [AddCardModel] = [AddCardModel("А- банк", #imageLiteral(resourceName: "кнопка моя карта")), AddCardModel("А- банк", #imageLiteral(resourceName: "кнопка моя карта")), AddCardModel("А- банк", #imageLiteral(resourceName: "кнопка моя карта")), AddCardModel("А- банк", #imageLiteral(resourceName: "кнопка моя карта")), AddCardModel("А- банк", #imageLiteral(resourceName: "кнопка моя карта")), AddCardModel("В чехле", #imageLiteral(resourceName: "кнопка моя карта")), AddCardModel("А- банк", #imageLiteral(resourceName: "specialPropose")), AddCardModel("Дека", #imageLiteral(resourceName: "кнопка моя карта")), AddCardModel("Дом игрушек", #imageLiteral(resourceName: "wait")), AddCardModel("Хрень", #imageLiteral(resourceName: "clearHistory")), AddCardModel("Жмень", #imageLiteral(resourceName: "кнопка моя карта")), AddCardModel("А- банк", #imageLiteral(resourceName: "кнопка моя карта")), AddCardModel("Сунь", #imageLiteral(resourceName: "кнопка моя карта"))]
    
    var wodsSection = [String]()
    var wordDict = [String: [AddCardModel]]()
    
    func generateWordDict(){
        for word in model{
            let key = "\(word.title.first!)"
            let lower = key.uppercased()
            
            if var wordsValues = wordDict[lower]{
                wordsValues.append(word)
                wordDict[lower] = wordsValues
            } else {
                wordDict[lower] = [word]
            }
        }
        wodsSection = [String](wordDict.keys)
        wodsSection = wodsSection.sorted()
        
    }
    
    func getModel(withIndexPath: IndexPath) -> AddCardModel{
           let wordKey = wodsSection[withIndexPath.section]
        return wordDict[wordKey]![withIndexPath.row]
    }
    
    func itemsCount(with section: Int) -> Int {
        let wordKey = wodsSection[section]
        if let wordValues = wordDict[wordKey]{
            return wordValues.count
        }
        return 0
    }
    
    func titleForeHeader(with section: Int) -> String{
        return wodsSection[section]
    }
    
    func sectionsCount() -> Int {
        return wodsSection.count
    }
    
    init() {
        generateWordDict()
    }
    
    
}
