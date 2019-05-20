//
//  LoginModelType.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation

protocol LoginModelType{
    
    var phoneNumber: String  {get set}
    var password: String {get set}
    
     func saveUserData()
    
      func cleraUserData()
     func fetchUserData() -> LoginDataBase?
    
}
