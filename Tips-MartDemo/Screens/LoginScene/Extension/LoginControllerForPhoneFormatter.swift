//
//  LoginControllerForPhoneFormatter.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import SwiftPhoneNumberFormatter

extension LoginViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.count == 0{
            AnimateView().movePlaceHolderZero(view: loginView.phoneNumberLabel)
            
        }
       
        if let phoneNumber = textField.text{
        self.loginModel.phoneNumber = phoneNumber
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        AnimateView().movePlaceHolderUp(view: loginView.phoneNumberLabel)
        if textField.text?.count == 0{
        setUpPhoneFormat()
        }
    }
    private func setUpPhoneFormat(){
        loginView.phoneNumberTextField.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: " (###) ###-##-##")
        loginView.phoneNumberTextField.prefix = "+38"
        
        
    }
}
