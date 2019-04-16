//
//  HideOrNot.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
protocol HideShowDelegate {
    func hide (views: [UIView])
    func show (views: [UIView])
}


class HideOrNot: HideShowDelegate{
    
    
    func hide (views: [UIView]){
        views.forEach { (view) in
            view.isHidden = true
        }
    }
    func show (views: [UIView]){
        views.forEach { (view) in
            view.isHidden = false
        }
    }
}
