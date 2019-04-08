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
    //MARK: labelsStack
    @IBOutlet weak var checkBoxStack: UIStackView!
    
    @IBOutlet weak var haveNoFriends: UIStackView!
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
    
    let fonts = CustomFonts()
    
    
    
    
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
        label.text = "Пароль из СМС"
        label.textColor = .lightGray
        return label
    }()

    let frindsPlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "ID или мобильный номер пригласившего"
        label.textColor = .lightGray
        label.font = label.font.withSize(10)
        return label
    }()
    let eyeButton: UIButton = {
       let button = UIButton()
       button.setImage(#imageLiteral(resourceName: "EyeOpen"), for: .normal)
        button.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.imageView?.frame = button.bounds
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    let repeatEyeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "EyeOpen"), for: .normal)
        button.addTarget(self, action: #selector(showRepeatPassword), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.imageView?.frame = button.bounds
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    let rightView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .blue
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 24)
        return view
    }()
    
    let buttonsLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textColor = .lightGray
//        gotham_pro_medium
        print(UIFont.familyNames)
        let font = UIFont(name: "GothamPro-Medium", size: 20)
        label.font = font
        return label
    }()

    var iconClick = false
    var iconRepClick = false
    var isAgreed = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
       passwordTetField.rightView?.addSubview(rightView)
        floatingDelegate = FloatingTextField()
        validateDelegate = ValidPhonePass()
        hideAndShowDelegate = HideOrNot()
        
        phoneTextField.delegate = self
        passwordTetField.delegate = self
        repeatPass.delegate = self
        friendId.delegate = self
        messagePassLabel.delegate = self
        
        setPlaceHolders()
        setUpButtons()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleEndEdit))
        self.view.addGestureRecognizer(tap)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
   @objc func handleEndEdit(){
       self.view.endEditing(true)
    }
    
    @objc func showPassword(sender: UIButton){
        
        if (iconClick == false) {
            sender.setImage(#imageLiteral(resourceName: "EyeClosed"), for: .normal)
            self.passwordTetField.isSecureTextEntry = false
            
        } else {
            sender.setImage(#imageLiteral(resourceName: "EyeOpen"), for: .normal)
            self.passwordTetField.isSecureTextEntry = true
        }
        iconClick = !iconClick
        print(iconClick)
        
    }
    @objc func showRepeatPassword(sender: UIButton){
        
        if (iconRepClick == false) {
            sender.setImage(#imageLiteral(resourceName: "EyeClosed"), for: .normal)
            self.repeatPass.isSecureTextEntry = false
            
        } else {
            sender.setImage(#imageLiteral(resourceName: "EyeOpen"), for: .normal)
            self.repeatPass.isSecureTextEntry = true
        }
        iconRepClick = !iconRepClick
        print(iconRepClick)
        
    }
    
    //MARK: IBAction stack
    @IBAction func enterBtn(_ sender: UIButton) {
        if let showOrHide = self.hideAndShowDelegate{
        let viewsToHide:[UIView] = [self.repeatPasswordStack, self.massegePasswordStack, self.friendsIdStack, self.regUnderscore, self.checkBoxStack, self.haveNoFriends ]
        let viewsToShow:[UIView] = [self.phonNumberStack, self.passwordStack, self.fbLabel, self.fbBtnLabel, self.enterUnderscore, self.forgetPass]
            showOrHide.hide(views: viewsToHide)
            showOrHide.show(views: viewsToShow)
            getStartedBtn.setTitle("Вход", for: .normal)
            getStartedBtn.isEnabled = true
            signUpLabel.titleLabel?.font = UIFont(name: fonts.lihgtGotham, size: 20)
            signInLabel.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
            
               animateShowAndHide()
        }
      
        
    }
    
    @IBAction func registrationBtn(_ sender: UIButton) {
       sender.setTitleColor(.white, for: .normal)
        if let showOrHide = self.hideAndShowDelegate{
        let viewsToHide:[UIView] = [ self.massegePasswordStack, self.fbLabel, self.fbBtnLabel, self.enterUnderscore, self.forgetPass, self.haveNoFriends]
        let viewsToShow:[UIView] = [self.phonNumberStack, self.passwordStack, self.repeatPasswordStack, self.friendsIdStack, self.regUnderscore, self.checkBoxStack]
            showOrHide.hide(views: viewsToHide)
            showOrHide.show(views: viewsToShow)
//            buttonsLabel.frame = sender.bounds
//            sender.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
//            sender.addSubview(buttonsLabel)
           signUpLabel.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
            signInLabel.titleLabel?.font = UIFont(name: fonts.lihgtGotham, size: 20)
            getStartedBtn.setTitle("Регистрация", for: .normal)
            getStartedBtn.isEnabled = false
            
            animateShowAndHide()
        }
        
    }
    
    @IBAction func checkBoxBtn(_ sender: UIButton) {
        if (isAgreed == false) {
            sender.setImage(#imageLiteral(resourceName: "checkNonActive"), for: .normal)
           self.getStartedBtn.isEnabled = false
            
        } else {
            sender.setImage(#imageLiteral(resourceName: "checkActive"), for: .normal)
           self.getStartedBtn.isEnabled = true
            
        }
        isAgreed = !isAgreed
        print(isAgreed)
        
    }
    
    @IBAction func forgetPassBtn(_ sender: UIButton) {
        if let showOrHide = self.hideAndShowDelegate{
        let viewsToShow:[UIView] = [ self.massegePasswordStack, self.fbLabel, self.fbBtnLabel]
        let viewsToHide:[UIView] = [self.phonNumberStack, self.passwordStack, self.repeatPasswordStack, self.friendsIdStack, self.regUnderscore, self.enterUnderscore, self.checkBoxStack, self.haveNoFriends]
            
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
//        UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
//            self.stackTextField.alpha = 0.5
//        }) { (_) in
//            self.stackTextField.alpha = 1
////            self.stackTextField.removeFromSuperview()
//        }
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
    
    // MARK: TextFieldDelegate Stack
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTextField{
        textField.text = formattedNumber(number: textField.text!)
        }
        
        
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
            } else if textField == repeatPass {
                floatingDelegate?.moveBack(view: repeatPlaceHolder)
                return true
            } else if textField == friendId {
                floatingDelegate?.moveBack(view: frindsPlaceHolder)
                
              
                
                return true
            } else if textField == messagePassLabel {
                floatingDelegate?.moveBack(view: massegePlaceHolder)
                return true
            }
        } else {
            if textField == passwordTetField{
                if textField.text!.count <= 8{
                    floatingDelegate?.moveDown(view: passPlaceHolder)
                }
            }
        }
        
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == friendId {
            
            if textField.text?.count == 0{
            
            self.haveNoFriends.isHidden = false
            self.getStartedBtn.titleLabel?.numberOfLines = 0
            self.getStartedBtn.titleLabel?.textAlignment = .center
            self.getStartedBtn.setTitle("Меня никто не приглашал", for: .normal)
            
            }
        }
        
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //MARK: SetUP TexField'sPlaceholders
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
    
    func setUpButtons(){
        
       
        
        self.passwordTetField.rightView = self.eyeButton
        self.passwordTetField.rightViewMode = .always
        self.repeatPass.rightView = self.repeatEyeButton
        self.repeatPass.rightViewMode = .always
    }
    
  }

