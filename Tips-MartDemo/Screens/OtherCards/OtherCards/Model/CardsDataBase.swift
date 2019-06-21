//
//  CardsDataBase.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/19/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift

class CardsDataBase: Object{
    
    @objc dynamic var cardName: String = ""
    @objc dynamic var cardId: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var logoImage: Data?
    
}
