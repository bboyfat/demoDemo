//
//  DetailRefController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/11/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

enum FriendsType{
    case friends
    case acquaintances
    case strangers
}

class DetailRefController: UIViewController {
    
    var friendsType: FriendsType?
    
    
    @IBOutlet var detRefView: DetRefView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func friendsBtnAct(_ sender: UIButton) {
        friendsType = .friends
        let viewsToHide = [detRefView.acqUnderscore, detRefView.strangUnderscore]
        let viewsToShow = [detRefView.frUnderscore]
        HideOrNot().hide(views: viewsToHide as! [UIView])
        HideOrNot().show(views: viewsToShow as! [UIView])
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            
        }
    }
    @IBAction func acqBtnAct(_ sender: UIButton) {
        friendsType = .acquaintances
        let viewsToHide = [detRefView.strangUnderscore, detRefView.frUnderscore]
        let viewsToShow = [detRefView.acqUnderscore]
        HideOrNot().hide(views: viewsToHide as! [UIView])
        HideOrNot().show(views: viewsToShow as! [UIView])
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func strangBtnAct(_ sender: UIButton) {
        friendsType = .strangers
        let viewsToHide = [detRefView.acqUnderscore, detRefView.frUnderscore]
        let viewsToShow = [detRefView.strangUnderscore]
        HideOrNot().hide(views: viewsToHide as! [UIView])
        HideOrNot().show(views: viewsToShow as! [UIView])
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func returnBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
        }
    }
    
    
    
    
}


