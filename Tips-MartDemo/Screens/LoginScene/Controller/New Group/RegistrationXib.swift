//
//  RegistrationXib.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import SwiftPhoneNumberFormatter


class RegistrationXib: UIView{
    
    @IBOutlet weak var phoneNumber: PhoneFormattedTextField!
    @IBOutlet weak var passwordTextField: FloatingTextField!
    
    @IBOutlet weak var repeatPassword: FloatingTextField!
    
    @IBOutlet weak var frindsID: FloatingTextField!
    
    
    
    let nibName = "RegistrationXib"
    var contentVIew: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabels()
    }
    
    func setLabels(){
        passwordTextField.floattingPlaceholder.text = "Пароль"
        repeatPassword.floattingPlaceholder.text = "Повторите пароль"
        frindsID.floattingPlaceholder.text = "ID или номер телефона пригласившего"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        
        guard let view = loadViewFromNib() else {return}
        view.frame = self.bounds
        self.addSubview(view)
        contentVIew = view
        
    }
    
    func loadViewFromNib() -> UIView?{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
        
    }
}
