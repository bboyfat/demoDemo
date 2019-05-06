//
//  LoginViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/6/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
//import SwiftPhoneNumberFormatter

class LoginViewController: UIViewController {

    @IBOutlet var loginView: LoginView!
    
    // ShowHide
    let showOrHide = HideOrNot()
    
    //MARK: custom font
    let fonts = CustomFonts()
    //MARK: UserInfo Model
    
    var userInfoModel = Changes()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tapEndEdit()
        getData()
        phoneFormattedText()
    }
    
    //MARK: Send Requests buttonsAction
    
    @IBAction func sighnInBtnAction(_ sender: UIButton) {
        
    }
    
    @IBAction func sighnUpBtnAction(_ sender: UIButton) {
        let viewsToHide: [UIView] = [loginView.repeatPassword, loginView.friendsID, loginView.checkPrivacyStack, loginView.upRegisterUnderscore, loginView.sighnUpBtn, loginView.sighInBtn, loginView.sighnUpBtn, loginView.loginStackView, loginView.password, loginView.phoneNumber]
        let viewsToShow: [UIView] = [loginView.authCode, loginView.continueBtn]
        changeViews(views: viewsToShow, view: viewsToHide)
        animateShowAndHide()
    }
    @IBAction func continueBtnAction(_ sender: UIButton) {
        let viewsToHide: [UIView] = [loginView.authCode, loginView.continueBtn, loginView.completeBtn]
        let viewsToShow: [UIView] = [loginView.userInfoStack, loginView.nameStack, loginView.senameStack, loginView.birthDayStack, loginView.genderStack, loginView.completeBtn]
        
        changeViews(views: viewsToShow, view: viewsToHide)
        animateShowAndHide()
    }
    
    @IBAction func completeBtnAction(_ sender: UIButton) {
       
    }
    
    
    
    //MARK: Up Buttons Action
    
    @IBAction func choseLoginBtn(_ sender: UIButton) {
        let viewsToShow = [loginView.loginStackView, loginView.upEnterUnderscore, loginView.sighInBtn, loginView.phoneNumber, loginView.password]
        let viewsToHide = [loginView.registrationStackView, loginView.userInfoStack, loginView.registrationStackView, loginView.repeatPassword, loginView.friendsID, loginView.checkPrivacyStack, loginView.userInfoStack, loginView.senameStack, loginView.nameStack, loginView.birthDayStack, loginView.genderStack, loginView.upRegisterUnderscore, loginView.continueBtn, loginView.completeBtn, loginView.nameStack, loginView.senameStack, loginView.genderStack, loginView.birthDayStack, loginView.sighnUpBtn]
       
        changeFont(viewToMin:  loginView.upRegisterButton, viewToMax: loginView.upEnterButton)
        
         changeViews(views: viewsToShow as! [UIView], view: viewsToHide as! [UIView])
        animateShowAndHide()
        
    }
    
  
    
    @IBAction func chooseRegistrtionBtn(_ sender: UIButton) {
        sender.setTitleColor(.white, for: .normal)
        
         let viewsToShow = [loginView.registrationStackView, loginView.repeatPassword, loginView.friendsID, loginView.checkPrivacyStack, loginView.upRegisterUnderscore, loginView.sighnUpBtn]
        let viewsToHide = [loginView.userInfoStack, loginView.senameStack, loginView.nameStack, loginView.birthDayStack, loginView.genderStack, loginView.upEnterUnderscore, loginView.sighInBtn, loginView.continueBtn, loginView.completeBtn, loginView.sighInBtn]
        
        changeViews(views: viewsToShow as! [UIView], view: viewsToHide as! [UIView])
        
        changeFont(viewToMin: loginView.upEnterButton, viewToMax: loginView.upRegisterButton)
        
        
        animateShowAndHide()
    }
    
    
    //MARK: Get DataFromTextFields to model
    
    private func getData(){
        loginView.phoneNumberTextField.didEndEditing = {[weak self] in
             UserDefaults.standard.set($0.text, forKey: "phoneNumber")
            print($0.text)
        }
        self.loginView.passwordTextField.didEndEditing = { [weak self] in
            UserDefaults.standard.set($0.text, forKey: "password")
            print($0.text)
        }

        loginView.senameTextField.didEndEditing = {[weak self] in
            self?.userInfoModel.objChanges?.surname = $0.text
        }
        loginView.nameTextField.didEndEditing = {[weak self] in
            self?.userInfoModel.objChanges?.name = $0.text
            }
        
        //MARK: MUST CHECK!!!!!!!!!!!!!!!!!!! DON"T FORGET ABOUT IT!!!!
        loginView.birthDayTextField.didEndEditing = {[weak self] in
            (self?.userInfoModel.objChanges?.birthday = Double($0.text!))!
        }
        
    }
    
    //MARK: setup PhoneNumber textField
    
    private func phoneFormattedText(){
      
        }
        

    
    
}

























extension LoginViewController{
    
    
    //MARK: CustomHelpersFunctions (Minions :)
  private func animateShowAndHide(){
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    private func changeViews(views show: [UIView], view hide: [UIView]){
        showOrHide.hide(views: hide)
        showOrHide.show(views: show)
    }
    
    private func changeFont(viewToMin: UIButton, viewToMax: UIButton){
        viewToMax.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
        viewToMin.titleLabel?.font = UIFont(name: fonts.lihgtGotham, size: 20)
    }
    
    //MARK: TapGesture
     private func tapEndEdit(){
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(handleEndEditing))
        
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func handleEndEditing(){
        self.view.endEditing(true)
    }
}
