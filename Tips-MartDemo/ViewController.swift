//
//  ViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/4/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import iOSUtilitiesSource

import Firebase
import CoreData




class ViewController: UIViewController {
    
    
    
    
    
    
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
    @IBOutlet weak var phoneTextField: UITextField!
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
    var floatingDelegate: FloatingTextDelegate?
    var validateDelegate: ValidationDelegate?
    var hideAndShowDelegate: HideShowDelegate?
    
    
    
    
    //MARK: Custom font
    let fonts = CustomFonts()
    
    //MARK: RegistrationModel
    
    var registrationModel: RegistrationModelAPI  = RegistrationModelAPI()
    var regAuth: RegModelGet?
    var authModel: AuthModel?
    var userInfoChanges: Changes = Changes()
    var userInfoModel: ProfileModel = ProfileModel()
    
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
    let namePlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textColor = .lightGray
        label.font = label.font.withSize(10)
        return label
    }()
    let senamePlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Фамилия"
        label.textColor = .lightGray
        label.font = label.font.withSize(10)
        return label
    }()
    let birthDatePlaceHolder: UILabel = {
        let label = UILabel()
        label.text = "Дата рождения"
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
    //MARK: Custom DatePicker
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        
        
        
        
        picker.backgroundColor = UIColor(red: 78/255, green: 67/255, blue: 145/255, alpha: 0.9)
        picker.setValue(UIColor.white, forKey: "textColor")
        picker.tintColor = .white
        
        
        picker.datePickerMode = .date
        return picker
    }()
    
    
    
    //MARK: Bool Variables
    var iconClick = false
    var iconRepClick = false
    var isAgreed = false
    var isMale = false
    var isFemale = false
    
    
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
        birthDateTextField.delegate = self
        nameTextField.delegate = self
        seNameTextField.delegate = self
        
        birthDateTextField.inputView = datePicker
       

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
        let viewsToHide:[UIView] = [self.repeatPasswordStack, self.massegePasswordStack, self.friendsIdStack, self.regUnderscore, self.checkBoxStack, self.haveNoFriends, self.resendPassword, self.createRegistrationBtnOutlet, self.backButtonStack, self.nameSenameStack, regNameStack, senameStack, birthDateStack, acceptPasswordBtn, genderStack, missBtnOutlet ]
        let viewsToShow:[UIView] = [self.phonNumberStack, self.passwordStack, self.faceBookStack, self.enterUnderscore, self.forgetPass, self.getStartedBtn, self.faceBookStack, stackTextField]
            showOrHide.hide(views: viewsToHide)
            showOrHide.show(views: viewsToShow)
          
            getStartedBtn.isEnabled = true
            signUpLabel.titleLabel?.font = UIFont(name: fonts.lihgtGotham, size: 20)
            signInLabel.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
            
               animateShowAndHide()
        }
      
        
    }
    
    @IBAction func registrationBtn(_ sender: UIButton) {
       sender.setTitleColor(.white, for: .normal)
        if let showOrHide = self.hideAndShowDelegate{
        let viewsToHide:[UIView] = [ self.massegePasswordStack, self.faceBookStack, self.enterUnderscore, self.forgetPass, self.haveNoFriends, self.getStartedBtn, self.resendPassword, self.nameSenameStack, regNameStack, senameStack, birthDateStack, acceptPasswordBtn, dearUserLabel, genderStack, missBtnOutlet ]
        let viewsToShow:[UIView] = [self.phonNumberStack, self.passwordStack, self.repeatPasswordStack, self.friendsIdStack, self.regUnderscore, self.checkBoxStack, self.createRegistrationBtnOutlet, stackTextField]
            showOrHide.hide(views: viewsToHide)
            showOrHide.show(views: viewsToShow)

           signUpLabel.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
            signInLabel.titleLabel?.font = UIFont(name: fonts.lihgtGotham, size: 20)
            
            
            
            
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
       
        
        let tabBarController = MainTabBarControllerViewController()
       
       
        guard let regData = self.regAuth else { return }
        if regData.success == true{
        self.present(tabBarController, animated: true) {
             
        }
        } else {
            
            ErrorAlerts().loginErrorAlert(controller: self)
        }
      
    }
    
    @IBAction func createNewRegistration(_ sender: UIButton) {
       
        if isAgreed == true  && registrationModel.phoneNumber.count > 18 {
            
            
            if let showOrHide = self.hideAndShowDelegate{
                let viewsToShow:[UIView] = [ self.massegePasswordStack, self.backButtonStack, self.regUnderscore, self.resendPassword, self.acceptPasswordBtn, self.acceptPasswordBtn, stackTextField]
                let viewsToHide:[UIView] = [self.phonNumberStack, self.passwordStack,  self.repeatPasswordStack, self.friendsIdStack, self.regUnderscore, self.enterUnderscore, self.checkBoxStack, self.haveNoFriends, self.faceBookStack, self.forgetPass, self.createRegistrationBtnOutlet, dearUserLabel, genderStack, missBtnOutlet ]
                
                APIManager().getAuthCode(model: self.registrationModel) { (auth) in
                    self.authModel = auth
                }
               
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
            let viewsToHide:[UIView] = [ self.massegePasswordStack, self.faceBookStack, self.enterUnderscore, self.forgetPass,  self.haveNoFriends, self.backButtonStack, self.getStartedBtn, self.resendPassword, self.nameSenameStack, regNameStack, senameStack, birthDateStack, dearUserLabel, genderStack, missBtnOutlet ]
            let viewsToShow:[UIView] = [self.phonNumberStack, self.passwordStack, self.repeatPasswordStack, self.friendsIdStack,  self.regUnderscore, self.checkBoxStack, self.createRegistrationBtnOutlet, stackTextField]
            showOrHide.hide(views: viewsToHide)
            showOrHide.show(views: viewsToShow)
            
            signUpLabel.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
            signInLabel.titleLabel?.font = UIFont(name: fonts.lihgtGotham, size: 20)
           
            
            
            
            animateShowAndHide()
        }
    }
    
    @IBAction func acceptBtnAction(_ sender: UIButton) {
        if let showHide = self.hideAndShowDelegate{
        let viewsToSow = [self.nameSenameStack, regNameStack, senameStack, birthDateStack, regUnderscore, dearUserLabel, genderStack, missBtnOutlet, continueFinishButton ]
        let viewsToHide = [self.stackTextField, self.phonNumberStack, self.passwordStack, self.repeatPasswordStack, self.friendsIdStack, self.regUnderscore, self.checkBoxStack, backButtonStack, haveNoFriends, faceBookStack, resendPassword, acceptPasswordBtn]
            showHide.hide(views: viewsToHide as! [UIView])
            showHide.show(views: viewsToSow as! [UIView])
            if isMale == true{
                self.userInfoModel.gender = "male"
            }else if isFemale == true{
                self.userInfoModel.gender = "female"
            } else {
                self.userInfoModel.gender = " "
            }
            
           
            animateShowAndHide()
        }
        
    }
    
    @IBAction func sendUsersDataBtn(_ sender: UIButton) {
        print(registrationModel.authCode)
        
        guard let accesToken = self.regAuth?.data?.accessToken.value else { return }
        print(accesToken, "in sendUsersDataBtn")
            self.userInfoChanges.objChanges = self.userInfoModel
            APIChangeInfo().getAuthCode(model: userInfoModel, accessToken: accesToken) { (user) in
                
            }
        
        print("Data in sendUsersDataBtn", userInfoModel)
    }
    
    @IBAction func missIntroduction(_ sender: UIButton) {
        
//        apiDelegate = APIRegComplete()
//         APIRegComplete().getAuthCode(model: self.registrationModel)
        APIRegComplete().getAuthCode(model: self.registrationModel) { (data) in
            self.regAuth = data
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
    
    //MARK: Male Female buttons action
    
    @IBAction func maleButtonAction(_ sender: UIButton) {
        isMale = !isMale
        if isMale == true{
            maleBtnOutlet.setImage(#imageLiteral(resourceName: "radiOn"), for: .normal)
            femaleBtnOutlet.setImage(#imageLiteral(resourceName: "radioOff"), for: .normal)
            isFemale = false
            self.userInfoModel.gender = "male"
            
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
            self.userInfoModel.gender = "female"
             isMale = false
            
            
        } else {
            femaleBtnOutlet.setImage(#imageLiteral(resourceName: "radioOff"), for: .normal)
        }
        print("male is", isMale)
       
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
        namePlaceHolder.frame = nameTextField.bounds
        self.nameTextField.addSubview(namePlaceHolder)
        senamePlaceHolder.frame = seNameTextField.bounds
        self.seNameTextField.addSubview(senamePlaceHolder)
        birthDatePlaceHolder.frame = birthDateTextField.bounds
        self.birthDateTextField.addSubview(birthDatePlaceHolder)
        
    }
    
    func setUpButtons(){
        
        self.passwordTetField.rightView = self.eyeButton
        self.passwordTetField.rightViewMode = .always
        self.repeatPass.rightView = self.repeatEyeButton
        self.repeatPass.rightViewMode = .always
    }
    
  }





extension ViewController{
   
}


extension ViewController: UITextFieldDelegate{
    
    
   
    
    
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
        } else if nameTextField.isFirstResponder{
            floatingDelegate?.moveUp(view: namePlaceHolder, text: "Имя")
        } else if seNameTextField.isFirstResponder{
            floatingDelegate?.moveUp(view: senamePlaceHolder, text: "Фамилия")
        } else if birthDateTextField.isFirstResponder{
            floatingDelegate?.moveUp(view: birthDatePlaceHolder, text: "Дата рождения")
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
            } else if textField == namePlaceHolder {
                floatingDelegate?.moveBack(view: namePlaceHolder)
                self.userInfoModel.name = textField.text ?? " "
                return true
            } else if textField == seNameTextField {
               
                self.userInfoModel.surname = textField.text ??  " "
                print(userInfoModel.surname)
                floatingDelegate?.moveBack(view: senamePlaceHolder)
                return true
            } else if textField == birthDateTextField {
                
                
                let date = self.datePicker.date
                let dateFormater = DateFormatter()

                dateFormater.dateFormat = "dd.MM.yyyy"
                let birthDate = dateFormater.string(from: date)
                
                textField.text = birthDate
                let todayDate = date.timeIntervalSince1970
               self.userInfoModel.birthday = todayDate
                print(todayDate)
                return true
            }
        } else {
            if textField == passwordTetField{
                if textField.text!.count <= 8{
                    floatingDelegate?.moveDown(view: passPlaceHolder, text: "Пароль должен быть не менее 8 символов")
                } else{
                    self.registrationModel.password = textField.text ?? ""
                    APILogin().getAuthCode(model: self.registrationModel) { (info) in
                        self.regAuth = info
                        
                    }
                }
            } else if textField == phoneTextField{
                self.registrationModel.phoneNumber = textField.text ?? ""
            } else if textField == friendId {
                
                self.registrationModel.inviter = textField.text ?? ""
            } else if textField == messagePassLabel{
                
                guard let code = Int(textField.text ?? "0") else {return true}
                
                self.registrationModel.authCode = code
                print(registrationModel.authCode)
            }
        }
       
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == friendId {
            
            if textField.text?.count == 0{
                
                self.haveNoFriends.isHidden = false
                self.createRegistrationBtnOutlet.titleLabel?.numberOfLines = 0
                self.createRegistrationBtnOutlet.titleLabel?.textAlignment = .center
                self.createRegistrationBtnOutlet.setTitle("Меня никто не приглашал", for: .normal)
                
            }
        } else if textField == repeatPass {
           
                if textField.text != self.registrationModel.password{
                    self.floatingDelegate?.moveDown(view: repeatPlaceHolder, text: "Пароли не совпадают")
                    self.createRegistrationBtnOutlet.isEnabled = false
                } else {
                    self.createRegistrationBtnOutlet.isEnabled = true
                }
            
        } else if textField == birthDateTextField{
            
            guard let count = textField.text?.count else {return}
            if count == 0{
                self.floatingDelegate?.moveBack(view: birthDatePlaceHolder)
            }
            
        } else if textField == nameTextField {
            
            self.userInfoModel.name = textField.text ?? " "
            
        } else if textField == seNameTextField {
            
            self.userInfoModel.surname = textField.text ??  " "
            
            
            
        }
        
        
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
}

