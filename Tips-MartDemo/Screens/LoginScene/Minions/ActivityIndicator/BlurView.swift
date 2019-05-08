//
//  BlurView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/8/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class BlurView: UIView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(x: 20, y: 20, width: 40, height: 40)
        indicator.style = .whiteLarge
        indicator.startAnimating()
        return indicator
    }()
    
    
    
    func showActivityIndicatory(uiView: UIView) {
        self.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        self.center = uiView.center
        self.backgroundColor = UIColor(red: 69/255, green: 201/255, blue: 122/255, alpha: 1)
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.4182304144, green: 0.2545809448, blue: 0.5832342505, alpha: 1).cgColor
        self.addSubview(activityIndicator)
        uiView.addSubview(self)
    }
    
    override func layoutIfNeeded() {
        
    }

    
  
    
    
}
