//
//  AccountViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
  
    @IBOutlet weak var accountView: AccountView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountView.profilePhoto.parent = self
        setBalance()
        addTapToBalance()
        addTapToPending()
    }
    
   
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    private func setBalance(){
        guard let greenBalance = UserDefaults.standard.string(forKey: "greenBalance"),
            let grayBalance = UserDefaults.standard.string(forKey: "grayBalance") else {return}
        self.accountView?.greenBalanceLabel.text = greenBalance + " грн."
        self.accountView?.balanceGrayLabel.text = grayBalance + " грн."
    }
    
    func addTapToBalance(){
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(presentWD))
        accountView.balanceStack.addGestureRecognizer(tap)
    }
    func addTapToPending(){
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(presentPurchase))
        accountView.pendingStack.addGestureRecognizer(tap)
    }
    @objc func presentWD(){
        let vc = UIStoryboard(name: "WithDrawal", bundle: nil).instantiateViewController(withIdentifier: "withdrawalVc") as! WDViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    @objc func presentPurchase(){
        let vc = UIStoryboard(name: "OperationHistory", bundle: nil).instantiateViewController(withIdentifier: "operationVC") as! OperationHistoryController
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func showHistoryButton(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "OperationHistory", bundle: nil).instantiateViewController(withIdentifier: "operationVC") as! OperationHistoryController
        
        present(vc, animated: true, completion: nil)
    }
    @IBAction func notificationsBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotificationsMain", bundle: nil).instantiateViewController(withIdentifier: "notificationsVC") as! MainNotificationsController
        
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func profileSettingsScreen(_ sender: UIButton) {
        let vc = UIStoryboard(name: "ProfileSettScreen", bundle: nil).instantiateViewController(withIdentifier: "ProfileSettingsVC") as! ProfileSetController
        
        present(vc, animated: true) {
          
        }
    }
    
    @IBAction func balanceInfoBtn(_ sender: UIButton) {
        InfoAlert().presentAlert(view: self, title: balanceMassege)
    }
    @IBAction func pendingBalanceInfoBtn(_ sender: UIButton) {
        InfoAlert().presentAlert(view: self, title: pendingBalanceMassege)
    }
    
}

