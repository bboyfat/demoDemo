//
//  LoginModelType.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation

protocol LoginModelType{
    //MARK: Properties
    var phoneNumber: String  {get set}
    var password: String {get set}
    //MARK: Methods
    func saveUserData()
    func cleraUserData()
    func fetchUserData() -> LoginDataBase?
    
}
