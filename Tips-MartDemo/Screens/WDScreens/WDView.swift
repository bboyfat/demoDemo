//
//  WDView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class WDView: UIView {
    
    @IBOutlet weak var navigationView: UIView!
    
    let gradientLayer = CAGradientLayer()
    
    let purpleColor = UIColor(red: 79/255, green: 67/255, blue: 145/255, alpha: 1).cgColor
    let finishColor = UIColor(red: 142/255, green: 81/255, blue: 178/255, alpha: 0.95).cgColor
    
    override func awakeFromNib() {
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        gradientLayer.colors = [purpleColor, finishColor]
        navigationView.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = navigationView.frame
    }
}
