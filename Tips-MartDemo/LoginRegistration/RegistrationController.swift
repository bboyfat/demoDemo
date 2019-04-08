//
//  RegistrationController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/8/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol RegistrationModelDelegate{
    func newRegistrationWasCreated(data: LoginModel)
}

class RegistrationController: RegistrationModelDelegate{
    
    
    var regModel: [LoginModel] = []
    
    func newRegistrationWasCreated(data: LoginModel) {
        regModel.append(data)
    }
    
}
