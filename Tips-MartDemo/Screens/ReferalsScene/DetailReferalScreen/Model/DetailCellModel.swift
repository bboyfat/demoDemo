//
//  DetailCellModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/11/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class DetailCellModel{
    var image: UIImage
    var catText: String
    var valueText: String
    
    init(image: UIImage, catText: String, valueText: String) {
        self.image = image
        self.catText = catText
        self.valueText = valueText
    }
}
