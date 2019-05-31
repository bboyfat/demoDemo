//
//  AccountView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class AccountView: UIView {
    
    
    let gradientLayer = CAGradientLayer()
    
    let purpleColor = UIColor(red: 79/255, green: 67/255, blue: 145/255, alpha: 1).cgColor
    let finishColor = UIColor(red: 142/255, green: 81/255, blue: 178/255, alpha: 0.95).cgColor
    
    
    
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet var profilePhoto: AvatarView!
    
    @IBOutlet weak var referralsIncomeLabel: UILabel!
    @IBOutlet weak var totalCahsbackLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameSernameLabel: UILabel!
    @IBOutlet weak var greenBalanceLabel: UILabel!
    @IBOutlet weak var balanceGrayLabel: UILabel!
    @IBOutlet weak var badgeLabel: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setText()
        addGradient()
    }
    
    func addGradient(){
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        gradientLayer.colors = [purpleColor, finishColor]
        navigationView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setText(){
        if let userData = LogOutputViewModel().fetchData(){
            self.idLabel.text = userData.accountID.separate(every: 2, with: " ")
            self.nameSernameLabel.text = userData.name + " " + userData.surname
        }
    }
    
    override func layoutSubviews() {
        super.layoutIfNeeded()
        gradientLayer.frame = self.navigationView.bounds
        
        
    }
    
}
