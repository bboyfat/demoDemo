//
//  LaunchViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/4/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import Reachability

class WaitingScreenController: UIViewController {
    
    
    
    
    var registrationModel: RegistrationModelAPI  = RegistrationModelAPI()
    var regAuth: RegModelGet?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber"),
            let password = UserDefaults.standard.string(forKey: "password"){
//            self.registrationModel.phoneNumber = phoneNumber
//            self.registrationModel.password = password
//            APILogin().getAuthCode(model: self.registrationModel) { (info) in
//                self.regAuth = info
                OperationQueue.main.addOperation {
                    self.presentMainTab()
//                }

            }
        } else {
            OperationQueue.main.addOperation {
                self.presentloginController()
            }
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        
    }
    
   
    
    
    func presentMainTab(){
        let tabBarController = MainTabBarControllerViewController()
        
        
//        guard let regData = self.regAuth else { return }
//        if regData.success == true{
            self.present(tabBarController, animated: true) {
                
            }
//        } else {
//
//            ErrorAlerts().loginErrorAlert(controller: self)
//        }
    }
    func presentloginController(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as! ViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    

   

}
