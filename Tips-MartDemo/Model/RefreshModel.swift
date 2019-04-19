//
//  RefreshModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/19/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


struct RefreshModel: Decodable{
    var success: Bool
    var data: TokensData
}

struct TokensData: Decodable{
   var accessToken: AccessData
   var refreshToken: RefreshData
}
struct RefreshData: Decodable {
    var value: String
    var expires: String
}

struct AccessData: Decodable{
    var value: String
    var expires: String
}
