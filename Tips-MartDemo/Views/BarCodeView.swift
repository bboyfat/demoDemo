//
//  BarCodeView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class BarCodeView: UIView {

    @IBOutlet weak var navigationView: UIView!
    
    @IBOutlet weak var barCodeImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    let userId = UserDefaults.standard.string(forKey: "userId")
    let gradient = CAGradientLayer()
    let generator = BarCodeGenerator()
    let purpleColor = UIColor(red: 79/255, green: 67/255, blue: 145/255, alpha: 1).cgColor
    let finishColor = UIColor(red: 142/255, green: 81/255, blue: 178/255, alpha: 0.95).cgColor
    
    override func awakeFromNib() {
        guard let id = userId else {
            return
        }
        gradient.frame = navigationView.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.colors = [purpleColor, finishColor]
        
        navigationView.layer.insertSublayer(gradient, at: 0)
        
        
        
        
       let image =  generator.generateBrCode(from: id)
        self.barCodeImageView.image = image
        self.idLabel.text = id
    }
    
    override func layoutSubviews() {
        
    }
    
}
