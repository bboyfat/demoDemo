//
//  FloatingTextField.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation



import UIKit
protocol FloatingTextDelegate {
    func moveUp(view: UILabel, text: String)
    func moveDown(view: UILabel, text: String)
    func moveBack(view: UILabel)
    
}

class FloatingTextField: FloatingTextDelegate {
    
    
    
    
    func moveUp(view: UILabel, text: String){
        
        UIView.animate(withDuration: 0.25, animations: {
            view.frame.origin.y = -20
            view.textColor = .lightGray
            view.text = text
            view.font = view.font.withSize(10)
        }, completion: nil)
        
    }
    func moveBack(view: UILabel){
        UIView.animate(withDuration: 0.2) {
            view.frame.origin.y = 0
            view.textColor = .lightGray
            view.font = view.font.withSize(15)
        }
    }
    func moveDown(view: UILabel, text: String){
        UIView.animate(withDuration: 0.25, animations: {
            view.frame.origin.y = 25
            view.textColor = .red
            view.text = text
            view.font = view.font.withSize(10)
            
        }, completion: nil)
    }
    
 }
