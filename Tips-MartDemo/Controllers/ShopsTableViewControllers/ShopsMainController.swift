//
//  ShopsMainController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class ShopsMainController: UIViewController{
    
    var shopsArray: [ShopsModel] = []
    let accessToken = UserDefaults.standard.string(forKey: "accessToken")
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       myTableView.delegate = self
        myTableView.dataSource = self
       getShops()
        
        
    }
    
    
    
    func getShops(){
        if let token  = accessToken{
            ShopsApiRequest().formRequest(accesToken: token) { (array) in
                self.shopsArray = array

                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
                
            }
        }
    }
    
    
        

        
        
    
    

   

}


extension ShopsMainController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shopsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShopsTableViewCell
        
        
        let shop = self.shopsArray[indexPath.row]
         let valueOfCash = String(shop.extendedData.maxCashback.value)
        
        cell.shopName.text = shop.name
        cell.percentOfCashBack.text = valueOfCash + " " + shop.extendedData.maxCashback.currency
        
        return cell
    }
    
    
    
    
    
}
