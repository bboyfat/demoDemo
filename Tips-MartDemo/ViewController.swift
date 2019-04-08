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
    @IBOutlet weak var checkBoxBtnOutlet: UIButton!
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
    @IBOutlet weak var backButtonStack: UIStackView!
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
    
    //MARK: Refferences on delegates
    var floatingDelegate: FloatingTextDelegate?
    var validateDelegate: ValidationDelegate?
    var hideAndShowDelegate: HideShowDelegate?
    
    
    //MARK: Custom font
    let fonts = CustomFonts()
    
    //MARK: LoginModel
    
    var loginModel: LoginModel = LoginModel()
    
    //MARK: PLaceHOlders
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
        label.text = "ID или моб. номер пригласившего"
        label.textColor = .lightGray
        label.font = label.font.withSize(10)
        return label
    }()
    
    // MARK: Show Hide password buttons
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
    
    
    
    
    //MARK: Bool Variables
    var iconClick = false
    var iconRepClick = false
    var isAgreed = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
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
            self.forgetPass.setTitle("Забыли пароль?", for: .normal)
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

           signUpLabel.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
            signInLabel.titleLabel?.font = UIFont(name: fonts.lihgtGotham, size: 20)
            getStartedBtn.setTitle("Регистрация", for: .normal)
            
            
            animateShowAndHide()
        }
        
    }
    
    @IBAction func checkBoxBtn(_ sender: UIButton) {
         isAgreed = !isAgreed
        
        if (isAgreed == true) {
            sender.setImage(#imageLiteral(resourceName: "checkActive"), for: .normal)
            
            
        } else {
           
            sender.setImage(#imageLiteral(resourceName: "checkNonActive"), for: .normal)
            
        }
       
        print(isAgreed)
        
    }
    
    @IBAction func forgetPassBtn(_ sender: UIButton) {
       
        
        
        
    }
    @IBAction func sendDataBtn(_ sender: UIButton) {
        if isAgreed == true{
           
            
            if let showOrHide = self.hideAndShowDelegate{
                let viewsToShow:[UIView] = [ self.massegePasswordStack, self.backButtonStack, self.regUnderscore, self.forgetPass,]
                let viewsToHide:[UIView] = [self.phonNumberStack, self.passwordStack,  self.repeatPasswordStack, self.friendsIdStack, self.regUnderscore, self.enterUnderscore, self.checkBoxStack, self.haveNoFriends, self.fbLabel, self.fbBtnLabel]
                 self.forgetPass.setTitle("Прислать код повторно", for: .normal)
                showOrHide.hide(views: viewsToHide)
                showOrHide.show(views: viewsToShow)
                animateShowAndHide()
            }
            
            
        } else {
            let ac = UIAlertController(title: "Политика конфиденциальности", message: "Для того, чтобы продолжить подтвердите, что Вы принимаете пользовательское сглашение", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "Принимаю", style: .default) { (_) in
                self.isAgreed = true
                self.checkBoxBtnOutlet.setImage(#imageLiteral(resourceName: "checkActive"), for: .normal)
            }
            let cancel = UIAlertAction(title: "Не принимаю", style: .destructive, handler: nil)
            ac.addAction(action)
            ac.addAction(cancel)
            
            self.present(ac, animated: true, completion: nil)
        }
       
    }
    
    @IBAction func returnToRegistrationBtn(_ sender: UIButton) {
        if let showOrHide = self.hideAndShowDelegate{
            let viewsToHide:[UIView] = [ self.massegePasswordStack, self.fbLabel, self.fbBtnLabel, self.enterUnderscore, self.forgetPass,  self.haveNoFriends, self.backButtonStack]
            let viewsToShow:[UIView] = [self.phonNumberStack, self.passwordStack, self.repeatPasswordStack, self.friendsIdStack,  self.regUnderscore, self.checkBoxStack]
            showOrHide.hide(views: viewsToHide)
            showOrHide.show(views: viewsToShow)
            
            signUpLabel.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
            signInLabel.titleLabel?.font = UIFont(name: fonts.lihgtGotham, size: 20)
           
            getStartedBtn.setTitle("Регистрация", for: .normal)
            
            
            animateShowAndHide()
        }
    }
    
    func checkDataAlert(){
        let ac = UIAlertController(title: "ВНИМАНИЕ!", message: "Проверьте правильность введенных данных", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Хорошо", style: .default , handler: nil)
        ac.addAction(okAction)
        self.present(ac, animated: true, completion: nil)
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
            floatingDelegate?.moveUp(view: phonePlaceHolder, text: "Номер телефона")
        } else if passwordTetField.isFirstResponder {
            floatingDelegate?.moveUp(view: passPlaceHolder, text: "Пароль")
        } else if repeatPass.isFirstResponder {
            floatingDelegate?.moveUp(view: repeatPlaceHolder, text: "Повторите пароль")
        } else if messagePassLabel.isFirstResponder {
            floatingDelegate?.moveUp(view: massegePlaceHolder, text: "Пароль")
        } else if friendId.isFirstResponder {
            floatingDelegate?.moveUp(view: frindsPlaceHolder, text: "ID или моб. номер пригласившего")
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
                    floatingDelegate?.moveDown(view: passPlaceHolder, text: "Пароль должен быть не менее 8 символов")
                } else{
                    self.loginModel.password = textField.text
                }
            } else if textField == phoneTextField{
                self.loginModel.phoneNumber = textField.text
            } else if textField == friendId {
                self.loginModel.friendsId = textField.text
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
        } else if textField == repeatPass {
            if let password = self.loginModel.password{
                print(password)
                if textField.text != password{
                    self.floatingDelegate?.moveDown(view: repeatPlaceHolder, text: "Пароли не совпадают")
                    self.getStartedBtn.isEnabled = false
                } else {
                    self.getStartedBtn.isEnabled = true
                }
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

