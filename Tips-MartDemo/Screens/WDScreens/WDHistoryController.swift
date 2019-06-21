//
//  WDHistoryControllerViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class WDHistoryController: UIViewController {
    @IBOutlet var wdHistoryView: WDHistoryView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func disVC(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
