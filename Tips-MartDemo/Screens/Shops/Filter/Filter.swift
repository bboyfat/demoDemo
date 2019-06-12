//
//  Filter.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol FilterProtocol {
    func filter(categories: [Int], online: Bool?) -> [ShopsModels]
    func getOnlineCount() -> Int
    func getOfflineCount() -> Int
    func getShopsByCatCount(_ category: Int) -> Int
}


class Filter: FilterProtocol{
    
    var model: [ShopsModels]!

    func getOnlineCount() -> Int{
        var array: [ShopsModels] = []
        model.forEach { (shop) in
           
            if shop.type == "online"{
                array.append(shop)
            }
        }
        return array.count
    }
    func getOfflineCount() -> Int{
         var array: [ShopsModels] = []
        model.forEach { (shop) in
            if shop.type == "offline"{
                array.append(shop)
            }
        }
        return array.count
    }
    func allShopsCount() -> Int{
        return model.count
    }
    
    func getShopsByCatCount(_ category: Int) -> Int{
        var array: [ShopsModels] = []
        model.forEach { (shop) in
            if shop.categories.contains(category){
                array.append(shop)
            }
        }
        
         return array.count
    }
    
    
    
    
    func filter(categories: [Int], online: Bool?) -> [ShopsModels] {
        
        return model.filter { (shop) -> Bool in
            var isMatched: Bool = false
            categories.forEach({ (category) in
                shop.categories.forEach({ (shopCat) in
                    if shopCat == category  {
                        guard let online = online else { isMatched = true; return}
                         #warning("don't forget about isOnline param")
                        if shop.isSelected == online {
                            isMatched = true
                        }
                    }
                })
            })
            return isMatched
        }
    }
    func fetchShops(model: [ShopsModels]){
        self.model = model
    }
    
    init(model: [ShopsModels]) {
        fetchShops(model: model)
    }
    
}
