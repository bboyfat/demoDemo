//
//  AddCartController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/14/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class AddCartController: UIViewController {
    
    @IBOutlet weak var addCardTableView: UITableView!
    
   
    let addCardDSD = AddCardDSD()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCardTableView.dataSource = addCardDSD
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   
    @IBAction func createNewCard(_ sender: Any) {
        let vc = UIStoryboard(name: "CreateCard", bundle: nil).instantiateViewController(withIdentifier: "createCardVc") as! CreateCardController
        present(vc, animated: true, completion: nil)
    }
    
}
