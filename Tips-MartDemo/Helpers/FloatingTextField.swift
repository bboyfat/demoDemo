//
//  FloatingTextField.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation



import UIKit

@IBDesignable

class FloatingTextField: UITextField, UITextFieldDelegate {
    
    var didEndEditing: (FloatingTextField) -> () = { _ in}
    var didBeginEditing: (FloatingTextField) -> () = { _ in}
    
    open var floattingPlaceholder: UILabel = {
        let label = UILabel()
        
        
        return label
    }()
    
    
    func setup() {
        
        floattingPlaceholder.text = "HELOOOOO WORLD"
        floattingPlaceholder.font = floattingPlaceholder.font.withSize(10)
        floattingPlaceholder.textColor = .lightGray
        floattingPlaceholder.frame = self.bounds
        self.addSubview(floattingPlaceholder)
       
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        AnimateView().movePlaceHolderUp(view: floattingPlaceholder)
        didBeginEditing(self)
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        AnimateView().movePlaceHolderZero(view: floattingPlaceholder)
        didEndEditing(self)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        setup()
    }
    
    
    
    
 }
