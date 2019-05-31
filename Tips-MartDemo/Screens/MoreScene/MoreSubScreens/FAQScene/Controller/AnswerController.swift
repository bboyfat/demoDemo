//
//  AnswerController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/30/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class AnswerController: UIViewController {
    @IBOutlet var answerView: AnswerView!
    
    var model: FAQCellModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       setValues()
    }
    
    func setValues(){
        if let model = model{
            answerView.navigation.topItem?.title = model.question
            answerView.descriptionLabel.text = model.description
            if let example = model.example{
            answerView.exampleLabel.text = example
            }
        }
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
