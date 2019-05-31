//
//  ReferalsViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ReferalsViewController: UIViewController {
    
   
    @IBOutlet var referalsView: ReferalView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBAction func detailsBtn(_ sender: UIButton) {
       
    }
    @IBAction func friendsBtn(_ sender: UIButton) {
        presentDetails(.friends)
    }
    
    @IBAction func acqBtn(_ sender: UIButton) {
        presentDetails(.acquaintances)
    }
    @IBAction func strangersBtn(_ sender: Any) {
        presentDetails(.strangers)
    }
    func presentDetails(_ type: FriendsType){
        let vc = UIStoryboard(name: "DetailReferalScreen", bundle: nil).instantiateViewController(withIdentifier: "DetaiRefVc") as! DetailRefController
        vc.friendsType = type
        present(vc, animated: true) {
            
        }
    }
    
}



    
    
    
    
    
    

