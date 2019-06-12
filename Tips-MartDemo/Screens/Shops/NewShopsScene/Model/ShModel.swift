//
//  ShopsModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift

enum ShopType{
    case selected
    case allShops
}

class ShModel: NSObject{

    func getShops(shopType: ShopType) ->[ShopsModels]{
        return configArray(shopType: shopType)
    }
    
    private func configArray(shopType: ShopType) -> [ShopsModels]{
        var selectedShops: [ShopsModels] = []
        var allShops: [ShopsModels] = []
        do{
            let realm = try Realm()
            let array = Array(realm.objects(ShopsModels.self))
            allShops = array
            array.forEach { (shop) in
                if shop.isSelected{
                    selectedShops.append(shop)
                }
            }
        } catch {
            print("Can't FETCH!!")
        }
        switch shopType {
        case .selected:
            return selectedShops
        case .allShops:
            return allShops
        }
        
    }
    
}
