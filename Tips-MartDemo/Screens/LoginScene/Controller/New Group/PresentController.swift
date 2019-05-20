//
//  PresentController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/18/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class PresentController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var regContainerView: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInBtn(_ sender: UIButton) {
        
        regContainerView.constant = 0
        
    }
    @IBAction func signUpBtn(_ sender: UIButton) {
        
        regContainerView.constant = stackView.frame.width
        
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
