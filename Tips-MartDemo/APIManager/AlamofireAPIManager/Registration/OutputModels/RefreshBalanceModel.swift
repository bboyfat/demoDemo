//
//  RefreshBalanceModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


struct RefreshBalance: Decodable{
    var success: Bool
    var data: BalanceData
}

struct BalanceData: Decodable{
    var notifications: [NotificationModel]
    var selectedShops: [String]
    var balance: Balance
}
struct NotificationModel: Decodable{
    var notificationID: String
    var kind: Int
    var text: String
    var created: String
    var isReaded: Bool
}
