//
//  DetaileRefCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/11/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class DetaileRefCell: UITableViewCell {
    
    
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var catLbl: UILabel!
    @IBOutlet var valueLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setCornerRadius()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCornerRadius(){
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
    }

}
