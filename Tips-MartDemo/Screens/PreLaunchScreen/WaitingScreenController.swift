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
    
    var loginModel: LoginDataBase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loginModel = LoginViewModel().fetchDataFromRealm()
        if loginModel != nil{
            OperationQueue.main.addOperation {
                APILogin().getAuthCode { (info) in
                    if info.success == true{
                        self.presentMainTab()
                    } else {
                        ErrorAlerts.loginErrorAlert(controller: self)
                    }
                }
                
            }
           
        } else {
            presentloginController()
        }
        
        
    }
    
    func fetch(){
        let realm = try! Realm()
        
        let result = realm.objects(LoginDataBase.self)
        loginModel = result.first
        
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
