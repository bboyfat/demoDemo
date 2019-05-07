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
    
    // ShowHide
    let showOrHide = HideOrNot()
    //MARK: Save and fetch models
    var loginModel = LoginViewModel()
    var userData = UserData()
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
        fetchData()
        
    }
    
    //MARK: Fetch from data
    
    func fetchData(){
        let realm = try! Realm()
        
       let result = realm.objects(UserData.self)
//        let res = realm.object(ofType: <#T##Element.Type#>, forPrimaryKey: <#T##KeyType#>)
        
//        self.userData = result as! UserData
        
        print(result.first?.name)
        
    }
    
    //MARK: Send Requests buttonsAction
    
    @IBAction func sighnInBtnAction(_ sender: UIButton) {
        APILogin().getAuthCode { (auth) in
           
        }
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
       self.loginModel.saveUserData()
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
            self?.userDefaults.set($0.text, forKey: "password")
            if let password = $0.text{
                self?.loginModel.password = password
            }
        }

        loginView.senameTextField.didEndEditing = {[weak self] in
            self?.userInfoModel.objChanges?.surname = $0.text
            if let secondName = $0.text{
                self?.loginModel.secondName = secondName
            }
        }
        loginView.nameTextField.didEndEditing = {[weak self] in
            self?.userInfoModel.objChanges?.name = $0.text
            if let name = $0.text{
                self?.loginModel.name = name
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
            self?.loginModel.birthDay = Double(birthDay)
                
            }
           }
        
    }
    }




























