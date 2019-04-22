//
//  GetInfoModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation

struct GetInfoModel: Decodable{
    var success: Bool
    var data: RefInfo
}

struct RefInfo: Decodable{
    var totalCashback: Double
    var referralsIncome: Double
}
