//
//  ErrorAlerts.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ErrorAlerts: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   static func loginErrorAlert(controller: UIViewController){
        let ac = UIAlertController(title: "Внимание!", message: "Проверьте правильность введенных данных и повторите попытку  еще раз", preferredStyle: .actionSheet)
        
    let action = UIAlertAction(title: "OK", style: .default) { (_) in
        self.presentloginController(controller: controller)
    }
        ac.addAction(action)
        controller.present(ac, animated: true, completion: nil)
    }
    
    static func presentloginController(controller: UIViewController){
        let vc = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginScreen") as! LoginViewController
        OperationQueue.main.addOperation {
            controller.present(vc, animated: true, completion: nil)
        }
        
    }
}
