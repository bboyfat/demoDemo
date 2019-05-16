//
//  MapCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MapCell: UITableViewCell {
    
    @IBOutlet weak var shopsImageView: UIImageView!
    @IBOutlet weak var adresTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        shopsImageView.layer.cornerRadius = 40
        shopsImageView.layer.borderWidth = 2
        shopsImageView.layer.borderColor = #colorLiteral(red: 0, green: 0.8052297235, blue: 0.4442411065, alpha: 1)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
