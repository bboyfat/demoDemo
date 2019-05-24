//
//  RoundImageView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setRound()
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        setRound()
    }
    
    func setRound(){
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
    }

}
