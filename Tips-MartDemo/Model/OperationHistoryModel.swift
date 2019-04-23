//
//  OperationHistoryModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


struct OperationHistoryModel: Decodable{
    var success: Bool
    var purchases: [Purchases]
    
}

struct Purchases: Decodable {
    var status: Int
    var description: String
    var created: String
    var sumCashback: Double
}

