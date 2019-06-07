//
//  HistoryCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var orderInfoLabel: UILabel!
    @IBOutlet weak var totalCashbackLabel: UILabel!
    @IBOutlet weak var cahsbackStatusLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
