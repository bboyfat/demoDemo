//
//  ReviewCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol ReviewsCellDelegate: AnyObject {
    func reviewsTableViewCell(_ reviewCell: ReviewCell)
}

class ReviewCell: UITableViewCell {
    
    

    @IBOutlet weak var xibHeight: NSLayoutConstraint!
    @IBOutlet weak var reviewView: UIView!
    @IBOutlet weak var writeReviewBtn: UIButton!
    @IBOutlet weak var cellHeight: NSLayoutConstraint!
    
    
    var isChanged = false 
    
    weak var delegate: ReviewsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        writeReviewBtn.addTarget(self, action: #selector(animteFuckingCell), for: .touchUpInside)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
         writeReviewBtn.addTarget(self, action: #selector(animteFuckingCell), for: .touchUpInside)
    }
    
    @objc func animteFuckingCell(){
        if let delegate = delegate{
            self.delegate?.reviewsTableViewCell(self)
     
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        cellHeight.constant = 135
        xibHeight.constant = 0
    }

}


