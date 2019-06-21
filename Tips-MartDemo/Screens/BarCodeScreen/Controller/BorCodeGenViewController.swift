//
//  BorCodeGenViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

enum SenderIs{
    case mainPage
    case otherCards
}

class BorCodeGenViewController: UIViewController {
    
    let barView = BarCodeView()
    @IBOutlet weak var otherCardsBtnLbl: UIButton!
    
    var senderIs: SenderIs = .mainPage
    
    
    
    let swipe = UISwipeGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipe.direction = .down
        whoIsSender()
        swipe.addTarget(self, action: #selector(handleDismiss))
        barView.frame = self.view.bounds
        view.addGestureRecognizer(swipe)
        UIScreen.main.brightness = 1
        
    }
    func whoIsSender(){
        switch senderIs {
        case .mainPage:
            print("MainPage")
            otherCardsBtnLbl.isHidden = false
        case .otherCards:
            print("MainPage")
            otherCardsBtnLbl.isHidden = true
        }
    }
    
    @IBAction func dissmisBarVc(_ sender: Any) {
        handleDismiss()
    }
    
    
    @IBAction func otherCardsBtnAction(_ sender: Any) {
        let vc = UIStoryboard(name: "OtherCards", bundle: nil).instantiateViewController(withIdentifier: "otherCardVc") as! OtherCardsController
        present(vc, animated: true) {
            UIScreen.main.brightness = 0.3
        }
        
    }
    
    
    @objc func handleDismiss(){
        self.dismiss(animated: true) {
            UIScreen.main.brightness = 0.3
        }
    }
    
    
    
}
