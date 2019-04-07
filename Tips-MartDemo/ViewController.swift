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
    
    //MARK: LabelOutlets
    @IBOutlet weak var fbLabel: UILabel!
    
    //MARK: ButtonOUtlets
    @IBOutlet weak var fbBtnLabel: UIButton!
    @IBOutlet weak var forgetPass: UIButton!
    @IBOutlet weak var signUpLabel: UIButton!
    @IBOutlet weak var signInLabel: UIButton!
    @IBOutlet weak var getStartedBtn: UIButton!
    
    //Mark: StacViewOutlets
    @IBOutlet weak var stackTextField: UIStackView!
    
    //MARK: textfieldsStacks
    @IBOutlet weak var phonNumberStack: UIStackView!
    @IBOutlet weak var passwordStack: UIStackView!
    @IBOutlet weak var repeatPasswordStack: UIStackView!
    @IBOutlet weak var massegePasswordStack: UIStackView!
    @IBOutlet weak var friendsIdStack: UIStackView!
    
    // MARK: TextFieldOutlets
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTetField: UITextField!
    @IBOutlet weak var repeatPass: UITextField!
    @IBOutlet weak var friendId: UITextField!
    @IBOutlet weak var messagePassLabel: UITextField!
    
    //MARK: UnderScoresOutlets
    @IBOutlet weak var enterUnderscore: UIView!
    @IBOutlet weak var regUnderscore: UIView!
    
    
    var floatingDelegate: FloatingTextDelegate?
    var validateDelegate: ValidationDelegate?
    var hideAndShowDelegate: HideShowDelegate?
    
    
    
    
    
    
    let phonePlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "PhoneNumber"
        label.textColor = .lightGray
        return label
    }()
    let passPlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .lightGray
        return label
    }()
    let repeatPlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Repeat"
        label.textColor = .lightGray
        return label
    }()

    let massegePlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "oass"
        label.textColor = .lightGray
        return label
    }()

    let frindsPlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.textColor = .lightGray
        return label
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        floatingDelegate = FloatingTextField()
        validateDelegate = ValidPhonePass()
        hideAndShowDelegate = HideOrNot()
        
        phoneTextField.delegate = self
        passwordTetField.delegate = self
       
        setPlaceHolders()
        
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
        if let showOrHide = self.hideAndShowDelegate{
        let viewsToHide:[UIView] = [self.repeatPasswordStack, self.massegePasswordStack, self.friendsIdStack, self.regUnderscore ]
        let viewsToShow:[UIView] = [self.phonNumberStack, self.passwordStack, self.fbLabel, self.fbBtnLabel, self.enterUnderscore]
            showOrHide.hide(views: viewsToHide)
            showOrHide.show(views: viewsToShow)
               animateShowAndHide()
        }
      
        
    }
    
    @IBAction func registrationBtn(_ sender: UIButton) {
       sender.setTitleColor(.white, for: .normal)
        if let showOrHide = self.hideAndShowDelegate{
        let viewsToHide:[UIView] = [ self.massegePasswordStack, self.fbLabel, self.fbBtnLabel, self.enterUnderscore]
        let viewsToShow:[UIView] = [self.phonNumberStack, self.passwordStack, self.repeatPasswordStack, self.friendsIdStack, self.regUnderscore]
            showOrHide.hide(views: viewsToHide)
            showOrHide.show(views: viewsToShow)
            animateShowAndHide()
        }
        
    }
    @IBAction func forgetPassBtn(_ sender: Any) {
        if let showOrHide = self.hideAndShowDelegate{
        let viewsToShow:[UIView] = [ self.massegePasswordStack, self.fbLabel, self.fbBtnLabel]
        let viewsToHide:[UIView] = [self.phonNumberStack, self.passwordStack, self.repeatPasswordStack, self.friendsIdStack, self.regUnderscore, self.enterUnderscore]
            showOrHide.hide(views: viewsToHide)
            showOrHide.show(views: viewsToShow)
            animateShowAndHide()
        }
        
        
        
    }
    @IBAction func sendDataBtn(_ sender: UIButton) {
       
    }
    
    func animateShowAndHide(){
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            
        }, completion: nil)
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
       
        return maxCount(textField, range: range, string: string)
    }
    
    func maxCount(_ textField: UITextField, range: NSRange, string: String) -> Bool{
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else { return false}
        
        let updateText = currentText.replacingCharacters(in: stringRange, with: string)
         return updateText.count <= 19
    }
   
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
        
        if phoneTextField.isFirstResponder{
            floatingDelegate?.moveUp(view: phonePlaceHolder)
        } else if passwordTetField.isFirstResponder {
            floatingDelegate?.moveUp(view: passPlaceHolder)
        } else if repeatPass.isFirstResponder {
            floatingDelegate?.moveUp(view: repeatPlaceHolder)
        } else if messagePassLabel.isFirstResponder {
            floatingDelegate?.moveUp(view: massegePlaceHolder)
        } else if friendId.isFirstResponder {
            floatingDelegate?.moveUp(view: frindsPlaceHolder)
        }

       
      }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.count == 0{
            if textField == phoneTextField{
                floatingDelegate?.moveBack(view: phonePlaceHolder)
                return true
            } else if textField == passwordTetField {
                floatingDelegate?.moveBack(view: passPlaceHolder)
                return true
            }
        }
        
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else {return}
        
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    func setPlaceHolders(){
        phonePlaceHolder.frame = phoneTextField.bounds
        self.phoneTextField.addSubview(phonePlaceHolder)
        passPlaceHolder.frame = passwordTetField.bounds
        self.passwordTetField.addSubview(passPlaceHolder)
        repeatPlaceHolder.frame = repeatPass.bounds
        self.repeatPass.addSubview(repeatPlaceHolder)
        massegePlaceHolder.frame = messagePassLabel.bounds
        self.messagePassLabel.addSubview(massegePlaceHolder)
        frindsPlaceHolder.frame = friendId.bounds
        self.friendId.addSubview(frindsPlaceHolder)
        
      }
    
  }

