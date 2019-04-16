//
//  ValidPhonePass.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


protocol ValidationDelegate {
    func isValid(phone: String) -> Bool
    func isCorrectPassword(pass: String) -> Bool
}

class ValidPhonePass: ValidationDelegate{
    
    
    
    func isValid(phone: String) -> Bool{
        
        if phone.count < 19{
            return false
        }
        return true
    }
    func isCorrectPassword(pass: String) -> Bool{
        if pass.count < 8{
            return false
        }
        return true
    }
}
