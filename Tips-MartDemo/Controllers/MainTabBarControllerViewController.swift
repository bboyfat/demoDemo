//
//  MainTabBarControllerViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MainTabBarControllerViewController: UITabBarController {
    
    let mainVc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "mainScreenVc") as! MainPageViewController
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainVc.tabBarItem = UITabBarItem(title: "Main", image: #imageLiteral(resourceName: "Fill 1"), tag: 0)
        mainVc.view.isUserInteractionEnabled = true
     viewControllers = [mainVc]
       
    }
    

    

}
