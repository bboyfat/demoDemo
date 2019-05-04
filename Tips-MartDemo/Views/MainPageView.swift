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
    
    let name = UserDefaults.standard.string(forKey: "name")
    let surname = UserDefaults.standard.string(forKey: "surname")
    let userId = UserDefaults.standard.string(forKey: "userId")
    let balanceGreen = UserDefaults.standard.string(forKey: "greenBalance")
    let balanceGray = UserDefaults.standard.string(forKey: "grayBalance")
    
    let gradientLayer = CAGradientLayer()
    
    let purpleColor = UIColor(red: 79/255, green: 67/255, blue: 145/255, alpha: 1).cgColor
    let finishColor = UIColor(red: 142/255, green: 81/255, blue: 178/255, alpha: 0.95).cgColor
    
    let swipe = UISwipeGestureRecognizer()
    let color = #colorLiteral(red: 0.3211668134, green: 0.2594678998, blue: 0.5882466435, alpha: 1)
   
    override func awakeFromNib() {
        
        banerView.animationImages = [UIImage(named: "banerBrowser"), UIImage(named: "BanerInvite"), UIImage(named: "BanerDownload")] as! [UIImage]
        
        banerView.animationDuration = 10
        banerView.startAnimating()
      
        photoImageView.layer.cornerRadius = 25
        photoImageView.layer.borderWidth = 2
        photoImageView.layer.borderColor = #colorLiteral(red: 0, green: 0.8052297235, blue: 0.4442411065, alpha: 1).cgColor
        gradientLayer.frame = navigationView.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        gradientLayer.colors = [purpleColor, finishColor]
        swipe.addTarget(self, action: #selector(returnHandle))
        swipe.direction = .down
    navigationView.layer.insertSublayer(gradientLayer, at: 0)
        self.addGestureRecognizer(swipe)
        
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
    }
   
   
    
    @objc func returnHandle(){
        
        self.reloadInputViews()
    }

    
    func setText(){
        guard let name = self.name, let surname = self.surname, let userId = self.userId, let greenBalanceString = balanceGreen, let grayBalanceString = balanceGray else { return }
        
        nameSurnameLabel.text = name + " " + surname
        
        idLabel.text = "ID: \(userId)"
        greenBalance.text = greenBalanceString + " грн."
        grayBalance.text = grayBalanceString + " грн."
    }
 
}
