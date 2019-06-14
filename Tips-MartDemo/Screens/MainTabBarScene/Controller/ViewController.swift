
//  ViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/4/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.


import UIKit
import iOSUtilitiesSource
import SwiftPhoneNumberFormatter

import Firebase
import CoreData





class ViewController: UIViewController {

    //MARK: UserDefaultsInfo

    //MARK: NameSenameStack

    @IBOutlet weak var birthDateStack: UIStackView!
    @IBOutlet weak var senameStack: UIStackView!
    @IBOutlet weak var regNameStack: UIStackView!
    @IBOutlet weak var genderStack: UIStackView!
    //MARK: LabelOutlets
    @IBOutlet weak var fbLabel: UILabel!

    @IBOutlet weak var dearUserLabel: UILabel!
    //MARK: ButtonOUtlets
    @IBOutlet weak var checkBoxBtnOutlet: UIButton!
    @IBOutlet weak var fbBtnLabel: UIButton!
    @IBOutlet weak var forgetPass: UIButton!
    @IBOutlet weak var signUpLabel: UIButton!
    @IBOutlet weak var signInLabel: UIButton!
    @IBOutlet weak var getStartedBtn: UIButton!

    @IBOutlet weak var acceptPasswordBtn: UIButton!
    @IBOutlet weak var continueButtonOutlet: UIButton!
    @IBOutlet weak var continueFinishButton: UIButton!
    @IBOutlet weak var resendPassword: UIButton!
    @IBOutlet weak var missBtnOutlet: UIButton!
    @IBOutlet weak var createRegistrationBtnOutlet: UIButton!
    //Mark: StacViewOutlets
    @IBOutlet weak var stackTextField: UIStackView!

    @IBOutlet weak var nameSenameStack: UIStackView!
    //MARK: Date picker

    @IBOutlet weak var pickerDateOutlet: UIDatePicker!

    //MARK: textfieldsStacks
    @IBOutlet weak var phonNumberStack: UIStackView!
    @IBOutlet weak var passwordStack: UIStackView!
    @IBOutlet weak var repeatPasswordStack: UIStackView!
    @IBOutlet weak var massegePasswordStack: UIStackView!
    @IBOutlet weak var friendsIdStack: UIStackView!
    @IBOutlet weak var backButtonStack: UIStackView!

    @IBOutlet weak var forgetPassStack: UIStackView!

    @IBOutlet weak var faceBookStack: UIStackView!

    @IBOutlet weak var getStartedStack: UIStackView!
    //MARK: labelsStack
    @IBOutlet weak var checkBoxStack: UIStackView!

    @IBOutlet weak var haveNoFriends: UIStackView!
    // MARK: TextFieldOutlets
    @IBOutlet weak var phoneTextField: PhoneFormattedTextField!
    @IBOutlet weak var passwordTetField: UITextField!
    @IBOutlet weak var repeatPass: UITextField!
    @IBOutlet weak var friendId: UITextField!
    @IBOutlet weak var messagePassLabel: UITextField!

    // MARK: Presentation Text Fields and button outlets


    @IBOutlet weak var seNameTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!

    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var maleBtnOutlet: UIButton!

    @IBOutlet weak var femaleBtnOutlet: UIButton!
    //MARK: UnderScoresOutlets
    @IBOutlet weak var enterUnderscore: UIView!
    @IBOutlet weak var regUnderscore: UIView!

    //MARK: Refferences on delegates
//    var floatingDelegate: FloatingTextDelegate?
    var validateDelegate: ValidationDelegate?
    var hideAndShowDelegate: HideShowDelegate?




    //MARK: Custom font
    let fonts = CustomFonts()

    //MARK: RegistrationModel


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
    var isMale = false
    var isFemale = false


    override func viewDidLoad() {
        super.viewDidLoad()



        validateDelegate = ValidPhonePass()
        hideAndShowDelegate = HideOrNot()






        setUpPhoneFormat()

        setUpButtons()

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleEndEdit))
        self.view.addGestureRecognizer(tap)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }

    // setup phone formatted textField
    private func setUpPhoneFormat(){
        self.phoneTextField.config.defaultConfiguration = PhoneFormat(defaultPhoneFormat: " (###) ###-##-##")
        phoneTextField.prefix = "+38"


    }



    // customized status bar
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

    }

    //MARK: IBAction stack
    @IBAction func enterBtn(_ sender: UIButton) { }

    @IBAction func registrationBtn(_ sender: UIButton) { }

    @IBAction func checkBoxBtn(_ sender: UIButton) {
         isAgreed = !isAgreed
        if (isAgreed == true) {
            sender.setImage(#imageLiteral(resourceName: "checkActive"), for: .normal)
         } else {
           sender.setImage(#imageLiteral(resourceName: "checkNonActive"), for: .normal)
         }
    }

    @IBAction func forgetPassBtn(_ sender: UIButton) {}

    @IBAction func sendDataBtn(_ sender: UIButton) {
        presentMainTab()
      }
    func presentMainTab(){
        let tabBarController = MainTabBarControllerViewController()

          self.present(tabBarController, animated: true)
        }

    @IBAction func createNewRegistration(_ sender: UIButton) {
             animateShowAndHide()
            }




    @IBAction func returnToRegistrationBtn(_ sender: UIButton) {
       }

    func presentPolicyAlert(){
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

    @IBAction func acceptBtnAction(_ sender: UIButton) {

           }

    @IBAction func sendUsersDataBtn(_ sender: UIButton) {

    }

    @IBAction func missIntroduction(_ sender: UIButton) {
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

    //MARK: Male Female buttons action

    @IBAction func maleButtonAction(_ sender: UIButton) {
        isMale = !isMale
        if isMale == true{
            maleBtnOutlet.setImage(#imageLiteral(resourceName: "radiOn"), for: .normal)
            femaleBtnOutlet.setImage(#imageLiteral(resourceName: "radioOff"), for: .normal)
            isFemale = false
//            self.userInfoModel.gender = "male"

        } else {
             maleBtnOutlet.setImage(#imageLiteral(resourceName: "radioOff"), for: .normal)
        }

        print("female is", isFemale)

    }

    @IBAction func femaleButtonAction(_ sender: UIButton) {
        isFemale = !isFemale
        if isFemale == true{
            femaleBtnOutlet.setImage(#imageLiteral(resourceName: "radiOn"), for: .normal)
            maleBtnOutlet.setImage(#imageLiteral(resourceName: "radioOff"), for: .normal)
//            self.userInfoModel.gender = "female"
             isMale = false


        } else {
            femaleBtnOutlet.setImage(#imageLiteral(resourceName: "radioOff"), for: .normal)
        }
        print("male is", isMale)

    }



    func setUpButtons(){

        self.passwordTetField.rightView = self.eyeButton
        self.passwordTetField.rightViewMode = .always
        self.repeatPass.rightView = self.repeatEyeButton
        self.repeatPass.rightViewMode = .always
    }

  }








