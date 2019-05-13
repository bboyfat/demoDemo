//
//  RgistrationInput.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


class RegistrationInput: InputModel, Codable{
    var phoneNumber = ""
    var authCode = 0
    var password = ""
    var inviter = ""
}
