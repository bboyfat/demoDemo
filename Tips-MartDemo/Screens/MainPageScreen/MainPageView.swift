//
//  MainProfileView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MainPageView: UIView {
    //NavigationView
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mapImageView: UIImageView!
    
    @IBOutlet weak var navigationView: UIView!
    // Mark: ImageViews
    @IBOutlet weak var banerView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    //MARK: Name ID
    
    @IBOutlet var nameSurnameLabel: UILabel!
    
    @IBOutlet var idLabel: UILabel!
    //MARK: Balance Outlet
    @IBOutlet weak var greenBalance: UILabel!
    @IBOutlet weak var grayBalance: UILabel!
    @IBOutlet weak var badgeLabel: UIButton!
    //MARK: Settings and Notif buttons outlet
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var anotherCardsBtn: UIButton!
    @IBOutlet weak var myCardBtn: UIButton!
    
    //MARK: Get data from user defaults
    let gradientLayer = CAGradientLayer()
    
    let purpleColor = UIColor(red: 79/255, green: 67/255, blue: 145/255, alpha: 1).cgColor
    let finishColor = UIColor(red: 142/255, green: 81/255, blue: 178/255, alpha: 0.95).cgColor
    
    override func awakeFromNib() {

        setCornerForTopAndBottom()
        setText()
    }
    
    func setCornerForTopAndBottom(){
        // settings for bottom
        anotherCardsBtn.clipsToBounds = true
        anotherCardsBtn.layer.cornerRadius = 5
        anotherCardsBtn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        // settings for top
        myCardBtn.clipsToBounds = true
        myCardBtn.layer.cornerRadius = 5
        myCardBtn.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        addGradient()
    }
    
    func addGradient(){
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        gradientLayer.colors = [purpleColor, finishColor]
        //         navigationView.layer.insertSublayer(gradientLayer, at: 0)
        navigationView.layer.insertSublayer(gradientLayer, at: 0)
    }
    func setText(){
        if let userData = LogOutputViewModel().fetchData(){
            self.idLabel.text = userData.accountID.separate(every: 2, with: " ")
            self.nameSurnameLabel.text = userData.name + " " + userData.surname
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.navigationView.bounds
        
        
       
        
    }
   
    
}

extension String {
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}
