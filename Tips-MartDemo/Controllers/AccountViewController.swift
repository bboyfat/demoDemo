//
//  AccountViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    let accountView = AccountView()

    override func viewDidLoad() {
        super.viewDidLoad()
        accountView.frame = self.view.bounds
       
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    

    @IBAction func showHistoryButton(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "OperationHistory", bundle: nil).instantiateViewController(withIdentifier: "operationVC") as! OperationHistoryController
        
        present(vc, animated: true, completion: nil)
    }
    

}

