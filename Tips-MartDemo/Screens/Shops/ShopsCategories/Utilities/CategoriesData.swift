//
//  CategoriesData.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/31/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation

protocol CategoriesDataDelegate{
    func throwData(categorieType: CategorieType) -> [CategoriesCellDataModel]
}

enum CategorieType{
    case products
    case services
}

class CategoriesData: CategoriesDataDelegate{
    
    
    
    
    
    func throwData(categorieType: CategorieType) -> [CategoriesCellDataModel] {
        switch categorieType {
        case .products:
            
            return parseJson(forResource: "products")
        case .services:
            return parseJson(forResource: "services")
        }
    }
    
    func parseJson(forResource: String) -> [CategoriesCellDataModel]{
        var categories: [CategoriesCellDataModel] = []
        do{
            let path = Bundle.main.path(forResource: forResource, ofType: "json")
            guard let checkedPath = path else { return []}
            let fileURl = URL(fileURLWithPath: checkedPath)
            let datA = try Data(contentsOf: fileURl)
            let json = try JSONDecoder().decode([Categories].self, from: datA)
            json.forEach { (category) in
                let adapter = CategoriesCellDataModel(title: category.name, categoriID: category.categoryID, childsTitle: category.subCategories, opened: false)
                categories.append(adapter)
            }
            
        } catch let jsErr {
            print(jsErr)
        }
        return categories
    }
    
}
