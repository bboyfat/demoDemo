//
//  AddCardModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/14/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit



class AddCardModel{
    var title: String
    var logoImage: UIImage
    
    
    init(_ title: String, _ logoImage: UIImage) {
        self.title = title
        self.logoImage = logoImage
    }
}
