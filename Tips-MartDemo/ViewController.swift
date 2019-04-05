//
//  ViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/4/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import iOSUtilitiesSource
import SwiftPhoneNumberFormatter
import Firebase




class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fbLabel: UILabel!
    
    @IBOutlet weak var fbBtnLabel: UIButton!
    @IBOutlet weak var forgetPass: UIButton!
    
    
    
    
    
    
   
    

    @IBOutlet weak var friendId: IuFloatingTextFiledPlaceHolder!
    
    @IBOutlet weak var repeatPass: IuFloatingTextFiledPlaceHolder!
    
    @IBOutlet weak var messagePassLabel: CustomTextField!
    
    @IBOutlet weak var signUpLabel: UIButton!
    @IBOutlet weak var signInLabel: UIButton!
    
    @IBOutlet weak var passwordNumberText: IuFloatingTextFiledPlaceHolder!
    
    @IBOutlet weak var stackTextField: UIStackView!
    @IBOutlet weak var phoneTextField: CustomTextField!
    
    @IBOutlet weak var getStartedBtn: UIButton!
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        phoneTextField.delegate = self
        phoneTextField.difference = 25
        
       
        
       
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleEndEdit))
        self.view.addGestureRecognizer(tap)
    }
    
    
    
    
   @objc func handleEndEdit(){
       self.view.endEditing(true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    @IBOutlet weak var enterUnderscore: UIView!
    
    @IBOutlet weak var regUnderscore: UIView!
    @IBAction func enterBtn(_ sender: UIButton) {
        
       self.passwordNumberText.isHidden = false
        self.repeatPass.isHidden = true
        self.friendId.isHidden = true
        self.getStartedBtn.setTitle("Вход", for: .normal)
       self.phoneTextField.isHidden = false
       self.messagePassLabel.isHidden = true
        self.fbLabel.isHidden = false
        self.fbBtnLabel.isHidden = false
        
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
            sender.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            self.enterUnderscore.backgroundColor = #colorLiteral(red: 0, green: 0.7925681472, blue: 0.2798518836, alpha: 1)
            self.regUnderscore.backgroundColor = #colorLiteral(red: 0, green: 0.7925681472, blue: 0.2798518836, alpha: 0)
        }
        
    }
    
    @IBAction func registrationBtn(_ sender: UIButton) {
       sender.setTitleColor(.white, for: .normal)
        
        self.repeatPass.isHidden = false
        self.friendId.isHidden = false
        self.getStartedBtn.setTitle("Регистрация", for: .normal)
        self.passwordNumberText.isHidden = false
        self.fbLabel.isHidden = true
        self.fbBtnLabel.isHidden = true
        self.messagePassLabel.isHidden = true
        UIView.animate(withDuration: 0.35) {
            self.view.layoutIfNeeded()
            sender.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            self.regUnderscore.backgroundColor = #colorLiteral(red: 0, green: 0.7925681472, blue: 0.2798518836, alpha: 1)
            self.enterUnderscore.backgroundColor = #colorLiteral(red: 0, green: 0.7925681472, blue: 0.2798518836, alpha: 0)
        }
        
    }
    
    @IBAction func sendDataBtn(_ sender: UIButton) {
       
        
        
        
        
        
    }
    
    private func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+XX (XXX) XXX XX XX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask {
            if index == cleanPhoneNumber.endIndex {
                break
            }
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
       
        return result
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.text = formattedNumber(number: textField.text!)
       
        var currentText = textField.text ?? ""
//        var rangeArr = [0,1,2,3,4,8,9,13,16]
//             let rangeLoc = range.location
//
//
//
//
//        switch rangeLoc {
//        case 0,1,2,3,4:
//          textField.text? = "+38 ("
//        case 8,9:
//
//            textField.text? += "3"
//////        case 3:
//////           textField.text? += "8"
//////        case 4:
//////            " "
//////        case 4:
//////            "("
//////        case 5:
//////            "0"
//        case 20:
//            return false
//        default:
//           return true
//        }
        
        
        
        
        
        
        guard let stringRange = Range(range, in: currentText) else { return false}
        
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
        
        
        
        let str = "+38 (0AB) CDE FG HI"
        let replaced = str.replacingOccurrences(of: "X", with: string)
        print(replaced)
            return updateText.count <= 19
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        textField.text = "+38 (0..)"
      
      }
    
    
    func updatePhoneNumber(){
        let phormatter = NumberFormatter()
        phormatter.numberStyle = .none
        
    }
    
    
        
    
    func isPhoneNumber(phone: String) -> Bool{
        var isValid = true
        
         let phoneRegEx = "\\+38\\ +(+0+[6-9]+[0-9]+)\\ +[0-90-90-9]\\ +[0-90-9]\\ +[0-90-9]"
        do{
            //An immutable representation of a compiled regular expression that you apply to Unicode strings.
            let regex = try NSRegularExpression(pattern: phoneRegEx)
            // convert our String to NSString
            let nsString = phone as NSString
            //Returns an array containing all the matches of the regular expression in the string.
            
            let result = regex.matches(in: phone, range: NSRange(location: 0, length: nsString.length))
            
            if result.count == 0{
                isValid = false
                
            }
            
        } catch{
            print("Email is not Valid")
            
        }
        
        
        
        print(isValid)
        return isValid
        
        
    }
    
    
    
        
  
    

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        
       
       
        if !isPhoneNumber(phone: text){
            textField.textColor = .red
            
        } else {
            textField.textColor = .green
        }
    }
    
    @IBAction func forgetPassBtn(_ sender: Any) {
        
        self.repeatPass.isHidden = true
        self.friendId.isHidden = true
        self.passwordNumberText.isHidden = true
        self.phoneTextField.isHidden = true
        self.messagePassLabel.isHidden = false
        self.fbLabel.isHidden = false
        self.fbBtnLabel.isHidden = false
        UIView.animate(withDuration: 0.35) {
             self.view.layoutIfNeeded()
        }
    }
    
    

        

}

