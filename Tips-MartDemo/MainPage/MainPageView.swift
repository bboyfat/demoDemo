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
    
    @IBOutlet weak var navigationView: UIView!
    // Mark: ImageViews
    @IBOutlet weak var banerView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    //MARK: Name ID
    @IBOutlet weak var myCardBtnOutlet: UIButton!
    @IBOutlet var nameSurnameLabel: UILabel!
    
    @IBOutlet var idLabel: UILabel!
    
    
    
    
    
    let gradientLayer = CAGradientLayer()
    
    let purpleColor = UIColor(red: 79/255, green: 67/255, blue: 145/255, alpha: 1).cgColor
    let finishColor = UIColor(red: 142/255, green: 81/255, blue: 178/255, alpha: 0.95).cgColor
    
    let swipe = UISwipeGestureRecognizer()
    let color = #colorLiteral(red: 0.3211668134, green: 0.2594678998, blue: 0.5882466435, alpha: 1)
    
    override func awakeFromNib() {
        
        banerView.animationImages = [UIImage(named: "banerBrowser"), UIImage(named: "BanerInvite"), UIImage(named: "BanerDownload")] as! [UIImage]
        
        banerView.animationDuration = 10
        banerView.startAnimating()
       
        photoImageView.layer.cornerRadius = 38.5
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
        
    }
    
    @objc func returnHandle(){
        
        self.reloadInputViews()
    }
    
//    func setUpText(){
//        let vc = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "mainScreenVc") as! MainPageViewController
//        guard let name = vc.infoModel.data?.name else { return }
//        guard let surname = vc.infoModel.data?.surname else { return }
//        guard let id = vc.infoModel.data?.userid else {return}
//
//       nameSurnameLabel.text = name + " " + surname
//        idLabel.text = "\(id)"
//
//    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
    
    func createSubviews() {
        self.frame = super.bounds
    }
    

}
