//
//  RowsCatCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/31/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol CategoriesCell: UITableViewCell {
    
}

class RowsCatCell: UITableViewCell, CategoriesCell {
    
    @IBOutlet weak var categoriesLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            accessoryType = .checkmark
        } else {
            accessoryType = .none
        }
        
    }
    
}
