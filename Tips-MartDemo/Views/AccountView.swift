//
//  AccountView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class AccountView: UIView {

    @IBOutlet weak var navigationView: UIView!
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameSernameLabel: UILabel!
    @IBOutlet weak var greenBalanceLabel: UILabel!
    @IBOutlet weak var balanceGrayLabel: UILabel!
    let name = UserDefaults.standard.string(forKey: "name")
    let surname = UserDefaults.standard.string(forKey: "surname")
    let userId = UserDefaults.standard.string(forKey: "userId")
    let balanceGreen = UserDefaults.standard.string(forKey: "greenBalance")
    let balanceGray = UserDefaults.standard.string(forKey: "grayBalance")
    
    let gradientLayer = CAGradientLayer()
    
    let purpleColor = UIColor(red: 79/255, green: 67/255, blue: 145/255, alpha: 1).cgColor
    let finishColor = UIColor(red: 142/255, green: 81/255, blue: 178/255, alpha: 0.95).cgColor
    
    
    override func awakeFromNib() {
        
        gradientLayer.frame = navigationView.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        gradientLayer.colors = [purpleColor, finishColor]
        navigationView.layer.insertSublayer(gradientLayer, at: 0)
        setText()
        
    }
    func setText(){
        guard let name = self.name, let surname = self.surname, let userId = self.userId, let greenBalanceString = balanceGreen, let grayBalanceString = balanceGray else { return }
        
        nameSernameLabel.text = name + " " + surname
        
        idLabel.text = "ID: \(userId)"
        greenBalanceLabel.text = greenBalanceString + " грн."
        balanceGrayLabel.text = grayBalanceString + " грн."
    }
}
