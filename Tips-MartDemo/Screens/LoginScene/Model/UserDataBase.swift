//
//  LoginRealmDataBase.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift


class UserData: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var secondName: String = ""
    @objc dynamic var birthDay: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var phoneNumber: String = ""
    @objc dynamic var gender: String = ""
}
