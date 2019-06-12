//
//  ShopsDataSource.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class ShopsDataSource: NSObject, UITableViewDataSource{
    
    var tableView: UITableView!
    
    var viewModel: ShopViewModelProtocol!
    
    
    
    func delObserver(){
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "Filtered"), object: CategoriesForFilter.shared)
    }
    func getOvserver(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(notifUpdate), name: NSNotification.Name(rawValue: "Filtered"), object: CategoriesForFilter.shared)
    }
    
    
    
    
    @objc func notifUpdate(_ notification: Notification){
        if let _ = notification.object as? CategoriesForFilter{
            tableView.reloadData()
        }
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return viewModel.rowsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ShopsTableViewCell else { return UITableViewCell()}
        let model = viewModel.getShop(with: indexPath)
        cell.isSelectedShop = model.isSelected
        cell.shopName.text = model.name
        let double = model.value
        let valueOfCash = String(double)
        let currency = model.currency
        cell.percentOfCashBack.text = valueOfCash + " " + currency
        GetLogos().urlPath(imagePath: model.pathImage) { (image) in
            if let forcedImage = image{
                cell.shopLogo.image = forcedImage
            }
        }
        cell.selectionStyle = .none
        cell.starSelect.tag = indexPath.row
        return cell
    }
    
    init(shopType: ShopType) {
        viewModel = ShopViewModel(shopType: shopType)
        super.init()
        
    }
    deinit {
        delObserver()
    }
    
}
extension ShopsDataSource: UITableViewDelegate{
    
}
