//
//  FilterController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/20/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class FilterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dissmis(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true) {
            
        }
    }
    
}
