//
//  BarCodeView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class BarCodeView: UIView {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var barCodeImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    let userId = LogOutputViewModel().fetchData()?.accountID
    
    let generator = BarCodeGenerator()
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let id = userId else {
            return
        }
        
       let image =  generator.generateBrCode(from: id)
        self.barCodeImageView.image = image
        self.idLabel.text = id.separate(every: 2, with: " ")
    }
    
}
