//
//  AccountViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
//    let accountView = AccountView()
    @IBOutlet weak var accountView: AccountView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    

    @IBAction func showHistoryButton(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "OperationHistory", bundle: nil).instantiateViewController(withIdentifier: "operationVC") as! OperationHistoryController
        
        present(vc, animated: true, completion: nil)
    }
    @IBAction func notificationsBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotificationsMain", bundle: nil).instantiateViewController(withIdentifier: "notificationsVC") as! MainNotificationsController
        
        present(vc, animated: true, completion: nil)
    }
    @IBAction func withdrawalBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "WithDrawal", bundle: nil).instantiateViewController(withIdentifier: "withdrawalVc") as! WDViewController
        present(vc, animated: true, completion: nil)
    }
    
}

