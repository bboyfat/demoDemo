//
//  LoginVCLittleFunctions.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


extension LoginViewController{
    
    
    //MARK: CustomHelpersFunctions (Minions :)
    
    //Func to animate show and Hide property
    
     func animateShowAndHide(){
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
       
        
    }
    
    // func to change isHidden to true or false
    
     func changeViews(views show: [UIView], view hide: [UIView]){
        showOrHide.hide(views: hide)
        showOrHide.show(views: show)
    }
    
    // changing font for up buttons
     func changeFont(viewToMin: UIButton, viewToMax: UIButton){
        viewToMax.titleLabel?.font = UIFont(name: fonts.mediumGotham, size: 20)
        viewToMin.titleLabel?.font = UIFont(name: fonts.lihgtGotham, size: 20)
    }
    
    //MARK: TapGesture for hide keyboard
     func tapEndEdit(){
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(handleEndEditing))
        
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func handleEndEditing(){
        self.view.endEditing(true)
    }
}

