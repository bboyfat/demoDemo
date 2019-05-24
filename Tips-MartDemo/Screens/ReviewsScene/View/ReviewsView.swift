//
//  ReviewsView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ReviewsView: UIView {

    @IBOutlet weak var infoHeight: NSLayoutConstraint!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    let gradientLayer = CAGradientLayer()
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//      setGradien()
       
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
//       setGradien()
    }
    func setGradien(){
        let gradienView = GradientView(frame: infoView.bounds)
        infoView.insertSubview(gradienView, at: 0)
    }
   

}
