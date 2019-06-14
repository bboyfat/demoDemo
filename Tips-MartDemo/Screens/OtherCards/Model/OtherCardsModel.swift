//
//  OtherCardsModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class OtherCardsModel{
    
    var cardName: String
    var cardId: Int
    var category: String
    var logoImage: UIImage
    
    
    init(crdName: String, cardId: Int, category: String, logoImage: UIImage) {
        self.cardId = cardId
        self.cardName = crdName
        self.category = category
        self.logoImage = logoImage
    }
    
}
