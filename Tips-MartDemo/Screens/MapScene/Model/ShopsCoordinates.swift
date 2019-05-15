//
//  ShopsCoordinates.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


class ShopsCoordinates: Decodable{
    
    var shopID: Int = 0
    var locations: [Locations]
    
    
}

class Locations: Decodable{

    var x: Double = 0 //longitude
    var y: Double = 0 //latitude
    var address: String = ""
    var phoneNumber: String = ""
    var pathImage: String = ""
}
