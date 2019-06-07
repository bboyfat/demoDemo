//
//  CategoryViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/6/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
protocol CategoryViewModelDelegate {
    func sectionsCount() -> Int
    func rowsCount(in section: Int) -> Int
    func getCategory(with indexPathSection: Int) -> CategoriesAdapter
    func openClose(in section: Int, opened: SwithcForTable)
}

class CategoryViewModel: CategoryViewModelDelegate{
    
    
    var model: [CategoriesAdapter]!
    
    func sectionsCount() -> Int{
        return model.count
    }
    
    func rowsCount(in section: Int) -> Int{
        return model[section].subCategories.count
    }
    
    func getCategory(with indexPathSection: Int) -> CategoriesAdapter{
        return model[indexPathSection]
    }
    func fetchData(modelType: CategorieType ){
        model = CategoryModel().throwData(categorieType: modelType)
    }
    
    // func to Show or Hide subCategories
    func openClose(in section: Int, opened: SwithcForTable){
        model[section].switchTable = opened
    }
    
    
    init(categoryType: CategorieType) {
        fetchData(modelType: categoryType)
    }
    
    
}
