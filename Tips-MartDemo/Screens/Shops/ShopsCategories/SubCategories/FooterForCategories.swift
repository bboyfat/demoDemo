//
//  FooterForCategories.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/3/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//


import UIKit

class FooterForCategories: UIView {
    
    
    let nibName = "FooterForCategories"
    
    var contentVIew: UIView?
    
    @IBOutlet weak var showMoreBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
