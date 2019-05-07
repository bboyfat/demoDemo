//
//  FemaleButton.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class FemaleButton: UIButton {
    
    var isFemale = false
    
    
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    @objc func handleTap(){
        isFemale = !isFemale
        if isFemale{
            setImage(#imageLiteral(resourceName: "radiOn"), for: .normal)
        } else {
            setImage(#imageLiteral(resourceName: "radioOff"), for: .normal)
        }
    }
}
