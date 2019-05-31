//
//  NotoficationCell.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol NotificationCellDelegate: AnyObject{
    func selectCells()
    
}

class NotificationCell: UITableViewCell {
    
    @IBOutlet weak var textNotifLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var contentViewCell: UIView!
    @IBOutlet weak var backGroundView: UIView!
    
    var delegate: NotificationCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @objc func more(_ sender: Any?){
        if let delegate = delegate{
            delegate.selectCells()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 69, left: 3, bottom: 10, right: 20))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if !selected{
            let backgView = UIView()
            backgView.backgroundColor = .clear
            
            backGroundView.backgroundColor = #colorLiteral(red: 0.9334012866, green: 0.9332357645, blue: 0.9418414235, alpha: 1)
            contentViewCell.backgroundColor = .clear
           self.selectedBackgroundView?.backgroundColor = .clear
            self.multipleSelectionBackgroundView = backgView
            //         self.contentView.backgroundColor = .clear
        } else {
             backGroundView.backgroundColor = #colorLiteral(red: 0.9334012866, green: 0.9332357645, blue: 0.9418414235, alpha: 1)
        }
        
    }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if !highlighted{
           self.backgroundColor = .clear
        backGroundView.backgroundColor = #colorLiteral(red: 0.9334012866, green: 0.9332357645, blue: 0.9418414235, alpha: 1)
                } else {
        backGroundView.backgroundColor = #colorLiteral(red: 0.9334012866, green: 0.9332357645, blue: 0.9418414235, alpha: 1)
    }
    }
    
}
