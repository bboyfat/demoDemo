//
//  CheckBoxButton.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class CheckBoxButton: UIButton {
    
    var isAgreed: Bool = false
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(handleAgree), for: .touchUpInside)
    }
    
    @objc func handleAgree(){
       isAgreed = !isAgreed
        if isAgreed {
            setImage(#imageLiteral(resourceName: "checkActive"), for: .normal)
        } else {
            setImage(#imageLiteral(resourceName: "checkNonActive"), for: .normal)
        }
        
       
    }
    
}
