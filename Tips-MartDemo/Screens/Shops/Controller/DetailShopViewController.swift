//
//  DetailShopViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class DetailShopViewController: UIViewController {
    
    
    @IBOutlet var detailView: DetailShopView!
    var shopsModel: ShopsModels?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = shopsModel{
             GetLogos().urlPath(imagePath: path.pathImage , completion: { (image) in
                self.detailView.logoImageView.image = image
                guard let value = self.shopsModel?.value else { return}
                self.detailView.cashbackValue.text = "\(value)"
                self.detailView.cashbackCurrency.text = self.shopsModel?.currency
            })
        }
    }
    
    
    
    
    @IBAction func popViewButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
