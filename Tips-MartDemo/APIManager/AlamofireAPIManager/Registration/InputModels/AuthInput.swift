//
//  AuthInput.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


class AuthInput: InputModel, Codable{
    var options = [AuthData()]
}

class AuthData: Codable{
    var inviter = ""
    var phoneNumber = ""
}
