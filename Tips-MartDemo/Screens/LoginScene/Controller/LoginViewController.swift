//
//  LoginViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/6/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import SwiftPhoneNumberFormatter
import RealmSwift

class LoginViewController: UIViewController {
    
    @IBOutlet var loginView: LoginView!
    
    var isAuthorized = false
    
    let blurView = BlurView()
    
    // ShowHide
    let showOrHide = HideOrNot()
    
    //MARK: Save and fetch models
    
    var loginModel = LoginViewModel()
    var userDataModel = UserDataModel()
    var userData: UserData?
    
    //MARK: custom font
    let fonts = CustomFonts()
    //MARK: UserInfo Model
    
    var userInfoModel = Changes()
    
    //UserDefaults
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.phoneNumberTextField.delegate = self
        tapEndEdit()
        getData()
    }
    
    private func checkAutorization() -> Bool{
        
        APILogin().getAuthCode { (auth) in
            
            if auth.success == true{
                self.presentTabBar()
            }
            
        }
        return true
    }
    
    private func presentTabBar(){
        
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBar") as! MainTabBarControllerViewController
        OperationQueue.main.addOperation {
            self.present(tabBarController, animated: true) {
                self.stopAnimateIndicator()
            }
        }
        
    }
    
    
    
    private func stopAnimateIndicator(){
        self.blurView.activityIndicator.startAnimating()
        blurView.removeFromSuperview()
    }
    
    
    
    //MARK: Send Requests buttonsAction
    
    @IBAction func sighnInBtnAction(_ sender: UIButton) {
        blurView.showActivityIndicatory(uiView: sender)
        self.checkAutorization()
    }
    
    @IBAction func sighnUpBtnAction(_ sender: UIButton) {
        let viewsToHide: [UIView] = [loginView.repeatPassword, loginView.friendsID, loginView.checkPrivacyStack, loginView.sighnUpBtn, loginView.sighInBtn, loginView.sighnUpBtn, loginView.loginStackView, loginView.password, loginView.phoneNumber]
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
        if userData == nil{
            self.userDataModel.saveUserData()
        }
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
        
        self.loginView.passwordTextField.didEndEditing = { [weak self] in
            if let password = $0.text{
                self?.loginModel.password = password
                self?.loginModel.saveUserData()
            }
        }
        
        loginView.senameTextField.didEndEditing = {[weak self] in
            if let secondName = $0.text{
                self?.userDataModel.secondName = secondName
            }
        }
        loginView.nameTextField.didEndEditing = {[weak self] in
            if let name = $0.text{
                self?.userDataModel.name = name
            }
        }
        
        
        loginView.birthDayTextField.didEndEditing = {[weak self] in
            let date = self?.loginView.datePicker.date
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "dd.MM.yyyy"
            let birthDate = dateFormater.string(from: date ?? Date())
            $0.text = birthDate
            let todayDate = date?.timeIntervalSince1970
            self?.userInfoModel.objChanges?.birthday = todayDate
            if let birthDay = todayDate{
                self?.userDataModel.birthDay = Double(birthDay)
                
            }
        }
        
    }
}




























