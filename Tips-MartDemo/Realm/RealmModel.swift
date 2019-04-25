//
//  RealmModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/25/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift

class ShopsModels: Object{
    
    @objc dynamic var url: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var shopID: Int = 0
    @objc dynamic var pathImage: String = ""
//    @objc dynamic var isConnection: Bool = false
//    @objc dynamic var isInExtension: Bool = false
     @objc dynamic var categories: Int = 0
    @objc dynamic var currency = ""
     @objc dynamic var value = 0.0
    
}

class NotificationModelRealm: Object{
    
     @objc dynamic var notificationID: String = ""
     @objc dynamic var kind: Int = 0
     @objc dynamic var text: String = ""
     @objc dynamic var created: String = ""
     @objc dynamic var isReaded: Bool = false
    
    
    
}
