//
//  CategoryButton.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/3/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class CategoryButton: UIButton {

    var isSelect: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addTarget(self, action: #selector(handleAgree), for: .touchUpInside)
       
    }
    
    @objc func handleAgree(){
        isSelect = !isSelect
        if isSelect {
            setImage(#imageLiteral(resourceName: "selectBtn"), for: .normal)
        } else {
            setImage(#imageLiteral(resourceName: "Rectangle 2"), for: .normal)
        }
        
        
    }

}
