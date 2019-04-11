//
//  RegistrationModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/9/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


class RegistrationModelAPI: Codable{
    
    var inviter: String = ""
    
    var phoneNumber: String = ""
    
    var password: String = ""
    
    var authCode: Int = 0
    
}

