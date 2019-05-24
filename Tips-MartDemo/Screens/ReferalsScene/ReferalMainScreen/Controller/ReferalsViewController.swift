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
        let vc = UIStoryboard(name: "DetailReferalScreen", bundle: nil).instantiateViewController(withIdentifier: "DetaiRefVc") as! DetailRefController
        
        present(vc, animated: true) {
            
        }
    }
    
    func addRefCell(){
        
        
    }
    
}



    
    
    
    
    
    

