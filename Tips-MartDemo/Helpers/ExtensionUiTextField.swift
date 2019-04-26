//
//  ExtensionUiTextField.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/26/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


extension UITextField{
    
    static var textFieldLabel: UILabel = {
        var label = UILabel()
        
        return label
    }()
    
    func addLabel(textField: UITextField, with message: String, set color: UIColor){
        let textFieldlLabel: UILabel = {
            let label = UILabel()
            label.text = message
            label.textColor = color
            label.frame = textField.bounds
            return label
        }()
        
        textField.addSubview(textFieldlLabel)
        
        
    }
}
