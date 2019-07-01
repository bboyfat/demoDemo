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
    
    @IBOutlet var barCodeView: BarCodeView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var otherCardsBtnLbl: UIButton!
    
    var senderIs: SenderIs = .mainPage
    
    
    
    let swipe = UISwipeGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipe.direction = .down
        whoIsSender()
        swipe.addTarget(self, action: #selector(handleDismiss))
        
        UIScreen.main.brightness = 1
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        OrientationManager.landscapeSupported = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        OrientationManager.landscapeSupported = false
        //The code below will automatically rotate your device's orientation when you exit this ViewController
        let orientationValue = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(orientationValue, forKey: "orientation")
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
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        
        switch UIDevice.current.orientation{
        case .portrait:
            otherCardsBtnLbl.isHidden = false
            barCodeView.navigationBar.isHidden = false
            topConstraint.constant = 30
        case .portraitUpsideDown:
            otherCardsBtnLbl.isHidden = true
            barCodeView.navigationBar.isHidden = true
             topConstraint.constant = 0
        case .landscapeLeft:
            otherCardsBtnLbl.isHidden = true
            barCodeView.navigationBar.isHidden = true
             topConstraint.constant = 0
        case .landscapeRight:
            otherCardsBtnLbl.isHidden = true
            barCodeView.navigationBar.isHidden = true
             topConstraint.constant = 0
        default:
            otherCardsBtnLbl.isHidden = false
            barCodeView.navigationBar.isHidden = false
             topConstraint.constant = 30
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
