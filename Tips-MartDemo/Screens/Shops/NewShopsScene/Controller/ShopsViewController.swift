//
//  ShopsViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ShopsViewController: UIViewController {

    @IBOutlet weak var shopsTableView: UITableView!
    
    var shopType: ShopType = .allShops{
        didSet{
            setDelegate()
            shopsTableView.reloadData()
        }
    }
    
    var shopsDelegate: ShopsDataSource?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    func setDelegate(){
        shopsDelegate = ShopsDataSource(shopType: shopType)
        shopsDelegate?.tableView = shopsTableView
        shopsDelegate?.getOvserver()
        shopsTableView.delegate = shopsDelegate
        shopsTableView.dataSource = shopsDelegate
    }
    
    @IBAction func allShopsBtn(_ sender: UIButton) {
        shopType = .allShops
    }
    @IBAction func selectedShopsBtn(_ sender: UIButton) {
        shopType = .selected
    }
    
    @IBAction func categoriesBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CategoriesMain", bundle: nil).instantiateViewController(withIdentifier: "categoriesController") as! MainCategoriesController
        vc.categoriesFor = .shops
        present(vc, animated: true, completion: nil)
    }
    
}
