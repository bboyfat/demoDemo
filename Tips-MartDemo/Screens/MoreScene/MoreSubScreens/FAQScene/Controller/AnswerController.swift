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
            answerView.descriptionLabel.attributedText = attributedString(text: model.description, lineSpacing: 5)
            if let example = model.example{
            answerView.exampleLabel.attributedText = attributedString(text: example, lineSpacing: 5)
            }
        }
    }
    private func attributedString(text: String, lineSpacing: CGFloat) -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
