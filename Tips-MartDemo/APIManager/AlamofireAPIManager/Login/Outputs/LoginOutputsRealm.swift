//
//  LoginOutputsDataBase.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift

class LoginOutputsRealm: Object{
    
    @objc dynamic var name = ""
    @objc dynamic var surname = ""
    @objc dynamic var birthDay = ""
    @objc dynamic var gender = ""
    @objc dynamic var accountID = ""
    
    
    
}

