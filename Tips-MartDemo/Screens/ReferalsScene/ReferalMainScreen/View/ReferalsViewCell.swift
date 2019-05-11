//
//  ReferalsViewCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/9/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ReferalsViewCell: UITableViewCell {
    
    
    @IBOutlet var refImageView: UIImageView!

    @IBOutlet var infoBtn: UIButton!
    @IBOutlet var infoLbl: UILabel!
    
    @IBOutlet var frLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
        setCornerRadius()
    }
    
    func setCornerRadius(){
        refImageView.layer.cornerRadius = refImageView.frame.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func prepareForReuse() {

    }
    
}
