//
//  ShopViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol ShopViewModelProtocol {
   
    func rowsCount() -> Int
    func getShop(with indexPath: IndexPath) -> ShopsModels
    
}

enum FilteredShops{
    case filtered
    case nonFiltered
}


class ShopViewModel: ShopViewModelProtocol{
    
    var model: [ShopsModels]!
    var filter: FilterProtocol!
    var filteredShops: FilteredShops = .nonFiltered{
        didSet {
            filterShops(filteredShops: self.filteredShops)
        }
    }
    
    func rowsCount() -> Int {
        return model.count
    }
    
    func getShop(with indexPath: IndexPath) -> ShopsModels {
        return model[indexPath.row]
    }
    
    func filterShops(filteredShops: FilteredShops){
        switch filteredShops {
        case .nonFiltered:
            print("up up")
        case .filtered:
            model = filter.filter(categories: CategoriesForFilter.shared.categories, online: nil)
        }
        
    }
    
    private func getData(shopType: ShopType){
        self.model = ShModel().getShops(shopType: shopType)
    }
    
    init(shopType: ShopType) {
        getData(shopType: shopType)
        getOvserver()
        filter = Filter(model: model)
    }
}

extension ShopViewModel{
    func getOvserver(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(notifUpdate), name: NSNotification.Name(rawValue: "Filtered"), object: CategoriesForFilter.shared)
    }
    
    @objc func notifUpdate(_ notification: Notification){
        if let data = notification.object as? CategoriesForFilter{
            if !data.categories.isEmpty{
                self.filteredShops = .filtered
            } else {
                self.filteredShops = .nonFiltered
            }
        }
    }
    
}
