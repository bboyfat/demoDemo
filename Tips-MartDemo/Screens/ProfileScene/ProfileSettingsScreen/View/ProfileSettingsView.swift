//
//  ProfileSettingsView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ProfileSettingsView: UIView {

    @IBOutlet var avatarView: UIImageView!
    @IBOutlet var surnameTextField: FloatingTextField!
    @IBOutlet var birthDayTextField: FloatingTextField!
    @IBOutlet var nameTextField: FloatingTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadius()
        setPlaceHolders()
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    override func endEditing(_ force: Bool) -> Bool {
        super.endEditing(true)
        return true
    }
    func setCornerRadius(){
        avatarView.layer.cornerRadius = avatarView.frame.height / 2
    }
    
    func setPlaceHolders(){
        nameTextField.floattingPlaceholder.text = "имя"
        surnameTextField.floattingPlaceholder.text = "фамилия"
        birthDayTextField.floattingPlaceholder.text = "дата рождения"
    }
}
