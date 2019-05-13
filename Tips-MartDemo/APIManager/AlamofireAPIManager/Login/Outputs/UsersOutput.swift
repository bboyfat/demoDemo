//
//  RegModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/10/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


struct UsersOutput: Decodable{
    
    var success: Bool?
    var data: UsersData?
    
    
 }


struct UsersData: Decodable{
    var userid: Int
    var phoneNumber: String
    var name: String
    var surname: String?
    var createdTime: String
    var refreshToken: RefresshToken
    var accessToken: AccesToken
    var balance: Balance
}

struct RefresshToken: Decodable{
    var value: String
    var expires: String
}

struct AccesToken: Decodable{
    var value: String
    var expires: String
}
struct Balance: Decodable{
    var gray: Double
    var green: Double
}
