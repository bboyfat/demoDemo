//
//  BigAvatar.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/29/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class BigAvatar: UIView {
    
    @IBOutlet weak var avatarImageView: RoundImageView!
    
    @IBOutlet weak var clloseBtn: UIButton!
   
    
    let nibName = "BigAvatar"
    
    var contentVIew: UIView?
    
    
    @objc func handleDismiss(){
        self.removeFromSuperview()
    }
   
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        
        guard let view = loadViewFromNib() else {return}
        view.frame = self.bounds
        self.addSubview(view)
        contentVIew = view
        
    }
    
    func loadViewFromNib() -> UIView?{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
        
    }
    
    
    
    
}
