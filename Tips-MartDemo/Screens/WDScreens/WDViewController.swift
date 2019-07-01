//
//  WDViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class WDViewController: UIViewController {
    @IBOutlet var wdView: WDView!
    
    @IBOutlet weak var heightDetailView: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showPhoneDetails(_ sender: Any) {
        heightDetailView.constant = 340
    }
    @IBAction func wdHistoryBtn(_ sender: UIButton) {
       presentHIstory()
    }
    @IBAction func showWdDetails(_ sender: Any) {
         heightDetailView.constant = 300
        
    }
    
    func presentHIstory(){
        let vc = UIStoryboard(name: "WDHistory", bundle: nil).instantiateViewController(withIdentifier: "wdHistoryVc") as! WDHistoryController
        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func operationHistory(_ sender: Any) {
        presentHIstory()
    }
    
    
}
