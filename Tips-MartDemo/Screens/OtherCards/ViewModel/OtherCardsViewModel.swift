
//
//  OtherCardsViewMOdel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation

protocol OtherCardsVieModelProtocol {
    func itemsCount(with section: Int) -> Int
    func sectionsCount() -> Int
    func getModel(with indexPath: IndexPath) -> OtherCardsModel
}

class OtherCardsViewModel: OtherCardsVieModelProtocol{
   
    var modelSorted: [[OtherCardsModel]]!
    var model: [OtherCardsModel] = [OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") ), OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") ), OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") ), OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") ), OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") ), OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") ), OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") ), OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") ),OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") ), OtherCardsModel(crdName: "Silpo", cardId: 001000100, category: "restaurant", logoImage: #imageLiteral(resourceName: "сильпо") )]
    func sectionsCount() -> Int {
        return modelSorted.count
    }
    
    var decorator: ModelDecorator!
    
    
    func itemsCount(with section: Int) -> Int {
        return modelSorted[section].count
    }
    
    func getModel(with indexPath: IndexPath) -> OtherCardsModel{
        return modelSorted[indexPath.section][indexPath.row]
    }
    
    
    func fetch(){
        modelSorted = ModelDecorator().mySorting(model)
    }
    init() {
       fetch()
    }
    
}
