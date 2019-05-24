//
//  ShopsModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

struct ShopsModel: Decodable {
    
    var pathToShop: String
    var name: String
    var type: String
    var shopID: Int
    var pathToImage: String
    var countReviews: Int
    var isInExtension: Bool
    var categories: [Int]
    var maxCashback: Cashback
    var created: String
    var status: Int
}


struct Cashback: Decodable {
    var currency: String
    var value: Double
}

struct ImageLogo{
    var image: UIImage
}
