//
//  DetailMapCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/20/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class DetailMapCell: UITableViewCell {

    @IBOutlet weak var detaliImageView: UIImageView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
