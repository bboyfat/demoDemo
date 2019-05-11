//
//  CellModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/9/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class CellModel{
    
    var image: UIImage
    var btnText: String
    var infoText: String
    
    init(image: UIImage, btnText: String, infoText: String) {
        self.image = image
        self.btnText = btnText
        self.infoText = infoText
    }
    
}
