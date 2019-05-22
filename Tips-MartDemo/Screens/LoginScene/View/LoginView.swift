//
//  LoginView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/6/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import SwiftPhoneNumberFormatter

class LoginView: UIView {
    
    
    
    //UP buttons and underscores
    
    @IBOutlet weak var upEnterButton: UIButton!
    @IBOutlet weak var upRegisterButton: UIButton!
    @IBOutlet weak var upEnterUnderscore: UIView!
    @IBOutlet weak var upRegisterUnderscore: UIView!
    
    // MARK: big stackViews
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var registrationStackView: UIStackView!
    @IBOutlet weak var userInfoStack: UIStackView!
    
    // MARK: sub stackviews: Login
    
    @IBOutlet weak var phoneNumber: UIStackView!
    @IBOutlet weak var password: UIStackView!
    // MARK: sub stackviews: Registration
    
    @IBOutlet weak var repeatPassword: UIStackView!
    @IBOutlet weak var authCode: UIStackView!
    @IBOutlet weak var friendsID: UIStackView!
    @IBOutlet weak var emptyIDStack: UIStackView!
    @IBOutlet weak var checkPrivacyStack: UIStackView!
    
    // MARK: Info sub stacks
   
    
    @IBOutlet weak var senameStack: UIStackView!
    @IBOutlet weak var nameStack: UIStackView!
    @IBOutlet weak var birthDayStack: UIStackView!
    @IBOutlet weak var genderStack: UIStackView!
    
    //MARK: Login -TextFieldOulets
    
    @IBOutlet weak var phoneNumberTextField: PhoneFormattedTextField!
    
    @IBOutlet weak var passwordTextField: FloatingTextField!
    //MARK: Registration -TextFieldOulets
    
    @IBOutlet weak var repeatPassTextField: FloatingTextField!
    @IBOutlet weak var authCodeTextField: FloatingTextField!
    @IBOutlet weak var friendsIdTextField: FloatingTextField!
    @IBOutlet weak var emptyIdLabelOutlet: UILabel!
    
    //MARK: UserInfo - TextFieldOutlets
    
    @IBOutlet weak var dearUserLabel: UILabel!
    
    
    @IBOutlet weak var senameTextField: FloatingTextField!
    
    @IBOutlet weak var nameTextField: FloatingTextField!
    
    @IBOutlet weak var birthDayTextField: FloatingTextField!
    
    //MARK: DownSIghnUp Sighn In Continue Byttons
    
    @IBOutlet weak var sighInBtn: UIButton!
    @IBOutlet weak var sighnUpBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var completeBtn: UIButton!
    
    //MARK: Gender RadioButtons
    
    @IBOutlet var maleButton: MaleButton!
    @IBOutlet var femaleButton: FemaleButton!
    
    // floattingLabel for phon formatter textField
    let phoneNumberLabel: UILabel = {
       let label = UILabel()
        label.font = label.font.withSize(10)
        label.textColor = .lightGray
        return label
    }()
    
    // custom datePicker
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.backgroundColor = #colorLiteral(red: 0, green: 0.8052297235, blue: 0.4442411065, alpha: 1)
        picker.setValue(UIColor.white, forKey: "tintColor")
        picker.datePickerMode = .date
        return picker
    }()
    
    override func awakeFromNib() {
        setPhonelabel()
        setBirthDay()
        passwordTextField.floattingPlaceholder.text = "Пароль"
        repeatPassTextField.floattingPlaceholder.text = "Повторите пароль"
        authCodeTextField.floattingPlaceholder.text = "Enter code from SMS"
        friendsIdTextField.floattingPlaceholder.text = "Friend's ID or phone Number"
        senameTextField.floattingPlaceholder.text = "Last Name"
        nameTextField.floattingPlaceholder.text = "Name"
        birthDayTextField.floattingPlaceholder.text = "Birth Date"
    }
    
    //setup birthdate (datePicker)
    
    func setBirthDay(){
        
         birthDayTextField.inputView = datePicker
    }
    
    //setup phoneLabel
    func setPhonelabel(){
        phoneNumberLabel.text = "Номер телефона"
        phoneNumberLabel.frame = phoneNumberTextField.bounds
        phoneNumberTextField.addSubview(phoneNumberLabel)
    }
    
    override func layoutIfNeeded() {
        setPhonelabel()
    }
    
  
       
    
    
}

