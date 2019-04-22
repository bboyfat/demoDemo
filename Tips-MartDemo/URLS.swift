//
//  URLS.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


enum URLS: String{
    case ragistrationComplete = "https://client.tips-mart.com/auth/v1/registration"
    case login = "https://client.tips-mart.com/auth/v1/login"
    case changeInfo = "https://client.tips-mart.com/profile/v1/change-data"
    
    case shopsInfo = "https://tips-mart.com/files/shops.json"
    case refreshToken = "https://client.tips-mart.com/auth/v1/refresh-token"
    case refreshBalance = "https://client.tips-mart.com/home/v1/load-page"
    case referalsIncome = "https://client.tips-mart.com/profile/v1/user"
}
