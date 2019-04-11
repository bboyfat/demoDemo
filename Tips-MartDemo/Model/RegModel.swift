//
//  RegModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/10/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


class RegModelGet: Decodable{
    
    var success: Bool?
    var userid: Int?
    var refreshToken: [String: String]?
    var accessToken: [String: String]?
    
 }
