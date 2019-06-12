//
//  ShopsMainController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift


enum ContentType{
    case allShops
    case selectedShops
    case filteredShops
    case visitedShops
}
protocol FilterCategoryDelegate{
     func filter(categiries: [Int])
    var contentType: ContentType {get set}
}

class ShopsMainController: UIViewController, FilterCategoryDelegate{
    
    var shopsModelArray: [ShopsModels] = []
    var selectedShopsArray: [ShopsModels] = []
    var filteredShopsArray: [ShopsModels] = []
    var contentType: ContentType = .allShops {
        didSet{
          
        }
    }
    
    
    
    @IBAction func showCat(_ sender: UIButton) {

        
        
    }
    
    
    let accessToken = UserDefaults.standard.string(forKey: "accessToken")
    
    let tap = UITapGestureRecognizer()
    
  
    @IBOutlet var myTableView: UITableView!
    
    func filter(categiries: [Int]){
        
        contentType = .filteredShops
        shopsModelArray.forEach { (filt) in
            if filt.categories.contains(categiries[0]){
                filteredShopsArray.append(filt)
            }
            
        }
        reloadData(myTableView: myTableView)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        fetchDataFromRealm()
        tap.addTarget(self, action: #selector(handleEndEdit))
        self.shopsModelArray.forEach { (shop) in
            
            if shop.isSelected{
                self.selectedShopsArray.append(shop)
            }
        }
        if let token  = accessToken{
            ShopsApiRequest().formRequest(accesToken: token) { (array) in
                
            }
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = myTableView.indexPathForSelectedRow{
            myTableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    @objc func handleEndEdit(){
        view.endEditing(true)
        
    }
    
    
    @IBAction func selectShop(_ sender: UIButton) {
        
        selectedShop(row: sender.tag, button: sender)
        if let cell = sender.superview?.superview as? ShopsTableViewCell{
            cell.isSelectedShop = !cell.isSelectedShop
        }
    }
    
    
    func selectedShop(row: Int, button: UIButton){
        var shop: ShopsModels?
        switch contentType{
        case .allShops: shop = shopsModelArray[row]
        case .selectedShops: shop = selectedShopsArray[row]
        default:
            break
        }
        if let shop = shop{
            let realm = try! Realm()
            do{
                if !shop.isSelected{
                    try realm.write {
                        shop.isSelected = !shop.isSelected
                        self.selectedShopsArray.append(shop)
                        
                    }
                } else {
                    try realm.write {
                        shop.isSelected = false
                        
                        if  let index = selectedShopsArray.firstIndex(of: shop){
                            self.selectedShopsArray.remove(at: index)
                            let indexPath = IndexPath(row: index, section: 0)
                            myTableView.deleteRows(at: [indexPath], with: .fade)
                        }
                    }
                    
                }
            } catch {
                print("can't update")
            }
        }
    }
    
    @IBAction func selectedTable(_ sender: UIButton) {
        //        self.shopsModelArray = self.selectedShopsArray
        //        reloadData(myTableView: self.myTableView)
        contentType = .selectedShops
    }
    @IBAction func allShops(_ sender: Any) {
        fetchDataFromRealm()
        contentType = .allShops
    }
    
    
    
    
    func getShops(){
        if let token  = accessToken{
            ShopsApiRequest().formRequest(accesToken: token) { (array) in
                
            }
        }
    }
    
    func fetchDataFromRealm(){
        do{
            let realm = try Realm()
            self.shopsModelArray = Array(realm.objects(ShopsModels.self))
            self.reloadData(myTableView: self.myTableView)
        } catch {
            print("Can't FETCH!!")
        }
    }
}


extension ShopsMainController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch contentType{
        case .filteredShops: return self.filteredShopsArray.count
        case .allShops: return self.shopsModelArray.count
        case .selectedShops: return self.selectedShopsArray.count
        case .visitedShops: return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShopsTableViewCell
        
        var shop: ShopsModels?
        switch contentType{
        case .filteredShops: shop = filteredShopsArray[indexPath.row]
        case .allShops: shop = shopsModelArray[indexPath.row]
        case .selectedShops: shop = selectedShopsArray[indexPath.row]
        default:
            break
        }
        
        
        if let shop = shop {
            let array = Array(shop.categories)
            print(array)
            cell.categories = []
            array.forEach { (id) in
                cell.categories.append(id)
            }
            
            cell.isSelectedShop = shop.isSelected
            let double = shop.value
            let valueOfCash = String(double)
            cell.shopName.text = shop.name
            let currency = shop.currency
            cell.percentOfCashBack.text = valueOfCash + " " + currency
            GetLogos().urlPath(imagePath: shop.pathImage) { (image) in
                if let forcedImage = image{
                    cell.shopLogo.image = forcedImage
                }
            }
            cell.starSelect.tag = indexPath.row
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "DetailShopView", bundle: nil).instantiateViewController(withIdentifier: "detailShopVC") as! DetailShopViewController
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ShopsTableViewCell{
            let array = self.shopsModelArray[indexPath.section].categories
            
            array.forEach { (id) in
                
                cell.categories.append(id)
            }
            filter(categiries: [1502])
            
            print(cell.categories)
            
        }
        vc.shopsModel =  self.shopsModelArray[indexPath.row]
        //        present(vc, animated: true) {
        
        //        }
        
    }
    
    
    
    
    
}

extension ShopsMainController: UISearchBarDelegate{
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.handleEndEdit()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchShop(searchText: searchText, myTableView: self.myTableView)
        
        
    }
    
    func searchShop(searchText: String, myTableView: UITableView){
        
        let searchString = searchText
        var findedShopsArray: [ShopsModels] = []
        let realm = try! Realm()
        
        
        
        let predicate = NSPredicate(format: "name contains[c] %@", searchString)
        let result = realm.objects(ShopsModels.self).filter(predicate)
        
        if result.count > 0{
            for shop in result{
                findedShopsArray.append(shop)
            }
            shopsModelArray = findedShopsArray
            reloadData(myTableView: myTableView)
            
        } else if searchText.count == 0 {
            self.fetchDataFromRealm()
        } else {
            
            shopsModelArray = findedShopsArray
            reloadData(myTableView: myTableView)
            
        }
        
    }
    
    func reloadData(myTableView: UITableView){
        OperationQueue.main.addOperation {
            myTableView.reloadData()
        }
    }
    
    
    
}
