//
//  SighnInButton.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/8/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class SighnInButton: UIButton {
    
    let blurView = BlurView()

    override func awakeFromNib() {
        blurView.frame = self.bounds
        self.addSubview(blurView)
    }

}
