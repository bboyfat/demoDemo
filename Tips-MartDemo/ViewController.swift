//
//  ViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/4/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import iOSUtilitiesSource

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var phoneNumberText: UITextField!
    @IBOutlet weak var signUpLabel: UIButton!
    @IBOutlet weak var signInLabel: UIButton!
    
    @IBOutlet weak var passwordNumberText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleEndEdit))
        self.view.addGestureRecognizer(tap)
    }
    
    
   @objc func handleEndEdit(){
       self.view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    

    @IBAction func enterBtn(_ sender: UIButton) {
        
        sender.setTitleColor(.white, for: .normal)
        
        
        
    }
    
    @IBAction func registrationBtn(_ sender: UIButton) {
       sender.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func sendDataBtn(_ sender: UIButton) {
    }
}

