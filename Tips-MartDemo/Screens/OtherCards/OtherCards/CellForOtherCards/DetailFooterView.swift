//
//  DetailFooterView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class DetailFooterView: UICollectionReusableView {

    @IBOutlet weak var barCodeImage: UIImageView!
    @IBOutlet weak var cardNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UIView!
    @IBOutlet weak var cardIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        barCodeImage.image = nil
        cardNameLbl.text = nil
        cardIdLabel.text = nil
    }
    
}
