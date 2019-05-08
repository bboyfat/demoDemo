//
//  LaginDataBase.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/8/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift


class LoginDataBase: Object{
    
    
    @objc dynamic var phoneNumber: String = ""
    @objc dynamic var password: String = ""
    
    
}
