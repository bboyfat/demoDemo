//
//  ShopsModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

struct ShopsModel: Decodable {
    
    var url: String
    var name: String
    var type: String
    var shopID: Int
    var pathImage: String
    var isConnection: Bool
    var isInExtension: Bool
    var extendedData: ExtendedData
}

struct ExtendedData: Decodable {
    var categories: [Int]
    var maxCashback: Cashback
}

struct Cashback: Decodable {
    var currency: String
    var value: Double
}

struct ImageLogo{
    var image: UIImage
}
