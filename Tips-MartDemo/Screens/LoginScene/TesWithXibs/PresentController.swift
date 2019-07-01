//
//  PresentController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/18/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class PresentController: UIViewController {

    @IBOutlet weak var regWidth: NSLayoutConstraint!
    @IBOutlet weak var loginFlow: LoginXib!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signInBtn(_ sender: UIButton) {
        view.layoutIfNeeded()
         regWidth.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func signUpBtn(_ sender: UIButton) {
        view.layoutIfNeeded()
       regWidth.constant = self.view.frame.width
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    private func setTextFields(){
        
    }
    
    
}
