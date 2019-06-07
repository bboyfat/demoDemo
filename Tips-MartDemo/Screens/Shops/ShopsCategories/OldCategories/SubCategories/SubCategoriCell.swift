//
//  SubCategoriCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/31/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class SubCategoriCell: UITableViewCell, CategoriesCell {
    @IBOutlet weak var isSelectBtn: CheckBoxButton!
    @IBOutlet weak var categorieLabel: UILabel!
    
    var childCategories:[SubCategoriCell] = []
    
    var id: [Int] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
