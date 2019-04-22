//
//  MainTabBarControllerViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MainTabBarControllerViewController: UITabBarController {
    
    let accessToken = UserDefaults.standard.string(forKey: "accessToken")
    
    let mainVc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "mainScreenVc") as! MainPageViewController
    let profileVc = UIStoryboard(name: "Account", bundle: nil).instantiateViewController(withIdentifier: "acccountVC") as! AccountViewController
    let shopsVc = UIStoryboard(name: "Shops", bundle: nil).instantiateViewController(withIdentifier: "shopsVc")
    let referVc = UIStoryboard(name: "ReferalScreen", bundle: nil).instantiateViewController(withIdentifier: "referalVC")
    let moreVc = UIStoryboard(name: "MoreScreen", bundle: nil).instantiateViewController(withIdentifier: "MoreScreen")

    override func viewDidLoad() {
        super.viewDidLoad()
        GetReferalsInfo().getInf(header: accessToken!)
        mainVc.tabBarItem = UITabBarItem(title: "Main", image: #imageLiteral(resourceName: "mainScreenTab"), tag: 0)
        profileVc.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "Fill 1"), tag: 1)
        shopsVc.tabBarItem = UITabBarItem(title: "Shops", image: #imageLiteral(resourceName: "shopsTabs"), tag: 2)
        referVc.tabBarItem = UITabBarItem(title: "Refer", image: #imageLiteral(resourceName: "Group 8-1"), tag: 3)
        moreVc.tabBarItem = UITabBarItem(title: "More", image: #imageLiteral(resourceName: "moreIcon"), tag: 4)
        mainVc.view.isUserInteractionEnabled = true
     viewControllers = [mainVc, profileVc, shopsVc, referVc, moreVc]
       
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    

    

}
