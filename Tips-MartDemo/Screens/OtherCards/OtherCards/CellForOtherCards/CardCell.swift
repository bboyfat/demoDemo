//
//  CardCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                
                self.layer.shadowOpacity = 0.6
                self.layer.shadowColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1).cgColor
                self.layer.shadowRadius = 4

                
            }
            else
            {
                self.layer.shadowOpacity = 0.6
                self.layer.shadowColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0).cgColor
                self.layer.shadowRadius = 3

            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setSelected()
    }
    
   
  
    func setSelected(){
        if self.isSelected{
            self.layer.shadowColor = UIColor.blue.cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 200, height: 2000)
            self.layer.shadowRadius = 20
        }
    }
    
}
