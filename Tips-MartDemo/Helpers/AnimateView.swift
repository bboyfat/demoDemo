//
//  AnimateView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/6/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class AnimateView{
    
    func movePlaceHolderUp(view: UIView){
        
        UIView.animate(withDuration: 0.2) {
            view.frame.origin.y = -15
        }
        
    }
    
    func movePlaceHolderZero(view: UIView){
        
        UIView.animate(withDuration: 0.2) {
            view.frame.origin.y = 0
        }
        
        
    }
    
}
