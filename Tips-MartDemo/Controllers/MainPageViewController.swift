//
//  MainProfileViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    
  
    
    let mainView = MainPageView()
    var infoModel: RegModelGet = RegModelGet()
    
    let tap = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.frame = self.view.bounds
        mainView.isUserInteractionEnabled = true
        self.view.isUserInteractionEnabled = true
        tap.addTarget(self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tap)

    
        
      
       
    
     
       
    }
    
    
    @objc func handleTap(){
        print("TAP!!!!!!!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
    }
    
    @IBAction func showMyCodeBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "BarCode", bundle: nil).instantiateViewController(withIdentifier: "BarCodeVC")
        print("showMyCodeBtn")
        self.present(vc, animated: true) {
            UIView.animate(withDuration: 0.3, animations: {
                UIScreen.main.brightness = 1.0
            })
        }
        
    }
    
   
}
