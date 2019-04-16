//
//  BorCodeGenViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class BorCodeGenViewController: UIViewController {
    
    let barView = BarCodeView()
    let swipe = UISwipeGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
         swipe.direction = .down
        swipe.addTarget(self, action: #selector(handleDismiss))
        barView.frame = self.view.bounds
        view.addGestureRecognizer(swipe)
        
        
    }
    
    @objc func handleDismiss(){
        self.dismiss(animated: true) {
            UIView.animate(withDuration: 0.3, animations: {
                UIScreen.main.brightness = 0.3
            })
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
