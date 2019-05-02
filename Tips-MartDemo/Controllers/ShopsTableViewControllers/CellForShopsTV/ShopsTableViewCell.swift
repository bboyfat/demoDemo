//
//  ShopsTableViewCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ShopsTableViewCell: UITableViewCell {

    @IBOutlet weak var starSelect: UIButton!
    @IBOutlet weak var shopLogo: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var percentOfCashBack: UILabel!
    var isSelectedShop = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        shopLogo.image = nil
        shopName.text = nil
        percentOfCashBack.text = nil
    }

}
