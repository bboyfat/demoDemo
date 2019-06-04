//
//  CategoriesModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/31/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


enum OnOFFShopsTypre{
    case online
    case offline
    case allShops
}

struct CategoriesCellDataModel{
    var title: String
    var categoriID: Int
    var childsTitle: [SubCategory]
    var opened: Bool = false
    
}
import Foundation



struct Categories: Codable{
    var categoryID: Int
    var name: String
    var subCategories: [SubCategory]
   
    
}

struct SubCategory: Codable {
    var categoryID: Int
    var name: String
}
