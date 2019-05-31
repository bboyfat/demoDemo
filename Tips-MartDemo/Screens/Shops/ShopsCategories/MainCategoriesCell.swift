//
//  CategoriesCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/31/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MainCategoriesCell: UITableViewCell {

    @IBOutlet var isSelectBtn: CheckBoxButton!
    @IBOutlet var categoriesLabel: UILabel!
    @IBOutlet var shopsCountLabel: UILabel!
    
    var isSelectShops: Bool = false
    var categories: [Int] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
