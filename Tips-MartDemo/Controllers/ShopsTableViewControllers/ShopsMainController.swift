//
//  ShopsMainController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift

class ShopsMainController: UIViewController{
    
   
    var shopsModelArray: [ShopsModels] = []
    var selectedShopsArray: [ShopsModels] = []
    var isSelected = false
    
    
    
    let activityController: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = UIActivityIndicatorView.Style.whiteLarge
        view.color = #colorLiteral(red: 0, green: 0.8052297235, blue: 0.4442411065, alpha: 1)
        return view
    }()
    
    let blurView: UIView = {
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2049711045)
        
        
        return view
    }()
    
    let accessToken = UserDefaults.standard.string(forKey: "accessToken")
    
    let tap = UITapGestureRecognizer()
    
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        tap.addTarget(self, action: #selector(handleEndEdit))
        
        if let token  = accessToken{
            ShopsApiRequest().formRequest(accesToken: token) { (array) in
                
            }
        }
        
        fetchDataFromRealm()
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
       // convertPoint(CGPointZero, to: self.myTableView)
        var buttonPosition = sender.convert(CGPoint.zero, to: self.myTableView)
        var indexPath = self.myTableView.indexPathForRow(at: buttonPosition)!
        selectedShop(row: indexPath.row, button: sender)
        print(indexPath.row)
        
    
    }
    
    
    func selectedShop(row: Int, button: UIButton){
        
        let shop = shopsModelArray[row]
        let realm = try! Realm()
        do{
            try realm.write {
                shop.isSelected = true
              print(shop.name, shop.isSelected)
            }
        } catch {
            print("can't update")
        }
    }
    
    func setUpActivity(cell: ShopsTableViewCell){
        blurView.frame = cell.shopLogo.bounds
        activityController.frame.origin.x = cell.shopLogo.center.x
        blurView.addSubview(activityController)
        cell.shopLogo.addSubview(blurView)
        activityController.startAnimating()
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
        return self.shopsModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShopsTableViewCell
       
        let shop = self.shopsModelArray[indexPath.row]
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
        if shop.isSelected == true{
        cell.starSelect.setImage(#imageLiteral(resourceName: "selectedStar"), for: .normal)
        } else {
            cell.starSelect.setImage(#imageLiteral(resourceName: "starDeselected"), for: .normal)
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "DetailShopView", bundle: nil).instantiateViewController(withIdentifier: "detailShopVC") as! DetailShopViewController
       
         vc.shopsModel =  self.shopsModelArray[indexPath.row]
        present(vc, animated: true) {
            
            }
            
        }
    
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
      
    
        return indexPath.row
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        print(indexPath.row)
        return true
    }
   
    func stopAnim(){
        self.activityController.stopAnimating()
        self.activityController.removeFromSuperview()
        self.blurView.removeFromSuperview()
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
                print(shop.name)
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
