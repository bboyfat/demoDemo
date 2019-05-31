//
//  LaunchViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/4/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import Reachability
import RealmSwift

class WaitingScreenController: UIViewController {
    
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var centerX: NSLayoutConstraint!
    var loginModel: LoginDataBase?
    
    @IBOutlet weak var mainLogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animateLogo { (finish)  in
            
        }
        loginModel = LoginViewModel().fetchUserData()
        if loginModel != nil{
            OperationQueue.main.addOperation {
                APILogin().getAuthCode { (info) in
                    if info.success == true{
                        self.animateLogo(handler: { (finish) in
                            if finish{
                                 self.presentMainTab()
                            }
                        })
                       
                    } else {
                        ErrorAlerts.loginErrorAlert(controller: self)
                       
                    }
                }
                
            }
            
        } else {
            animateLogo { (finish) in
                if finish{
                    self.presentloginController()
                }
            }
            
        }
        
        
    }
    
    func animateLogo(handler: @escaping (_ status: Bool) -> ()){
        OperationQueue.main.addOperation {
            
            self.centerY.constant = -250
            
            UIView.animate(withDuration: 0.6) {
                self.view.layoutIfNeeded()
                self.mainLogo.alpha = 0
                
                  handler(true)
            }
          
        }
       
    }
    
    
    func presentMainTab(){
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBar") as! MainTabBarControllerViewController
        OperationQueue.main.addOperation {
            self.present(tabBarController, animated: true) {
                
            }
        }
     }
    func presentloginController(){
        let vc = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginScreen") as! LoginViewController
        OperationQueue.main.addOperation {
            self.present(vc, animated: true, completion: nil)
        }
        
    }
}
