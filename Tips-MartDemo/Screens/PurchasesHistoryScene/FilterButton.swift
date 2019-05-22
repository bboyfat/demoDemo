//
//  FilterButton.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/21/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class FilterButton: UIButton {

    
        var isAgreed: Bool = false
        
        override func awakeFromNib() {
            self.addTarget(self, action: #selector(handleAgree), for: .touchUpInside)
        }
        
        @objc func handleAgree(){
            isAgreed = !isAgreed
            if isAgreed {
                setImage(#imageLiteral(resourceName: "full"), for: .normal)
            } else {
                setImage(#imageLiteral(resourceName: "empty"), for: .normal)
            }
            
            
        }


}
