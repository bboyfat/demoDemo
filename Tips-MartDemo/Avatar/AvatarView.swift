//
//  AvatarView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/29/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class AvatarView: UIImageView{
    var getPhoto = AvatarViewModel()
    var biggerView: BigAvatar?
  
    var parent: UIViewController?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
       
        if let photoData = getPhoto.fetchImage(){
            self.image = photoData
        }
       
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
//        addTap()
    }
  
    func addTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleBiggerView))
        self.addGestureRecognizer(tap)
    }
    
    @objc func handleBiggerView(){
        if let parent = parent{
            biggerView = BigAvatar()
            biggerView!.frame = parent.view.bounds
            biggerView?.avatarImageView.center = parent.view.center
            let heigtt = (biggerView?.avatarImageView.frame.height)! / 2
            biggerView?.avatarImageView.layer.cornerRadius = heigtt
            biggerView?.clloseBtn.addTarget(self, action: #selector(handleDiss), for: .touchUpInside)
            parent.view.addSubview(biggerView!)
            setUpShapeLayer()
        }
       
    }
    
    func setUpShapeLayer(){
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.masksToBounds = false
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineWidth = 10
        shapeLayer.strokeColor = UIColor.green.cgColor
//        shapeLayer.position = CGPoint(x: (biggerView?.layer.bounds.midX)!, y: (biggerView?.layer.bounds.midY)!)
        biggerView?.avatarImageView.isOpaque = false
        let center = CGPoint(x: 150, y: 150)
//        let width = biggerView?.avatarImageView.frame.width
//        let path = UIBezierPath(roundedRect: biggerView!.avatarImageView.frame, byRoundingCorners: UIRectCorner(rawValue: 25), cornerRadii:CGSize(width: width!, height: width!))
        let path = UIBezierPath(arcCenter: center, radius: 150, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 2, clockwise: true)
        shapeLayer.path = path.cgPath
        
        biggerView?.avatarImageView.layer.addSublayer(shapeLayer)
        shapeLayer.add(addAnim(), forKey: "urSoBasic")
    }
    
    func addAnim() -> CABasicAnimation{
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0.3
       
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        return basicAnimation
    }
    
    
    @objc func handleDiss(){
        biggerView?.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTap()
    }
    
    required init(coder: NSCoder){
        super.init(coder: coder)!
        addTap()
    }
   
    
    

    
}
