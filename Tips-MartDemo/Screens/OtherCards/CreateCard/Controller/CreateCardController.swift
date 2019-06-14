//
//  CreateCardController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/14/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class CreateCardController: UIViewController {
    
    @IBOutlet weak var idTextFiled: UITextField!
    
    let btn: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "barCode"), for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        idTextFiled.rightView = btn
    }
    

    @IBAction func dismissBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createNewCard(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
