//
//  ShopsMainController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class ShopsMainController: UIViewController, UISearchBarDelegate{
    
    var shopsArray: [ShopsModel] = []
    
    
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
       getShops()
       setUpActivity()
        
        
        
        
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
    
    
    
    func setUpActivity(){
        blurView.frame = self.myTableView.bounds
        activityController.frame.origin.x = view.center.x
        activityController.frame.origin.y = 200
        blurView.addSubview(activityController)
        myTableView.addSubview(blurView)
        activityController.startAnimating()
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
        GetLogos().urlPath(imagePath: shop.pathImage) { (image) in
            if let forcedImage = image{
                
            cell.shopLogo.image = forcedImage
            } else {
                cell.shopLogo.image = #imageLiteral(resourceName: "default-avatar")
            }
        }
          stopAnim()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "DetailShopView", bundle: nil).instantiateViewController(withIdentifier: "detailShopVC") as! DetailShopViewController
         vc.shopsModel =  self.shopsArray[indexPath.row]
        present(vc, animated: true) {
            
            }
            
        }
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        myTableView.deselectRow(at: indexPath, animated: false)
        return myTableView.indexPathForSelectedRow
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: myTableView.indexPathForSelectedRow!, animated: false)
        
    }
        
    
    
    func stopAnim(){
        self.activityController.stopAnimating()
        self.activityController.removeFromSuperview()
        self.blurView.removeFromSuperview()
    }
    
    
    
    
    
}
