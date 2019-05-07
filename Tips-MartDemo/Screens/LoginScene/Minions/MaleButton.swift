//
//  MaleButton.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MaleButton: UIButton {
    


    var isMale = false
     
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    @objc func handleTap(){
        isMale = !isMale
        if isMale{
            setImage(#imageLiteral(resourceName: "radiOn"), for: .normal)
        } else {
            setImage(#imageLiteral(resourceName: "radioOff"), for: .normal)
        }
    }

}
