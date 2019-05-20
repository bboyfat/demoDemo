//
//  TestViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var regWidth: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterBtn(_ sender: UIButton) {
        regWidth.constant = 0
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func regBtn(_ sender: UIButton) {
        regWidth.constant = stackView.frame.width
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
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
