//
//  ReviewXib.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ReviewXib: UIView{
    @IBOutlet weak var sendReviewBtn: UIButton!
    @IBOutlet weak var checkBoxBtn: CheckBoxButton!
    
    @IBOutlet weak var reviewTextView: UITextView!
    let nibName = "ReviewXib"
    
    var contentVIew: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sendReviewBtn.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
    }
    
    @objc func handleSend(){
        print("Sent Btn")
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
