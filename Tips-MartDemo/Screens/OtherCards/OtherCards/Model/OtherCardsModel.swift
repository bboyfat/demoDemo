//
//  OtherCardsModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift
protocol OtherCardsModelProtocol {
    func saveData()
    func fetchData() -> [CardsDataBase]?
}


class OtherCardsModel: OtherCardsModelProtocol{
    
    var cardName: String = ""
    var cardId: String = ""
    var category: String = ""
    var logoImage: UIImage = #imageLiteral(resourceName: "Group 26")
    
    func saveData(){
       let cardsDataBase = CardsDataBase()
        cardsDataBase.setValue(self.cardName, forKey: "cardName")
        cardsDataBase.setValue(self.cardId, forKey: "cardId")
        cardsDataBase.setValue(self.category, forKey: "category")
        cardsDataBase.setValue(imageToData(), forKey: "logoImage")
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(cardsDataBase)
            }
        } catch let saveErr{
            print("Can't save user's data", saveErr)
        }
       
    }
    func imageToData() -> Data?{
        guard let data = logoImage.pngData() else {return nil }
        return data
    }
    
    func fetchWithPredicate(text: String) -> [CardsDataBase]{
        let realm = try! Realm()
        let predicate =  NSPredicate(format: "cardName contains[c] %@", text)
        let result = Array(realm.objects(CardsDataBase.self).filter(predicate))
        if result.count > 0{
            return result
        } else {
            return fetchData() ?? []
        }
    }
    
    func fetchData() -> [CardsDataBase]?{
        var cardsDataBase: [CardsDataBase]?
            let realm = try! Realm()
            let result = Array(realm.objects(CardsDataBase.self))
            cardsDataBase = result
        return cardsDataBase
    }

    
    
}
