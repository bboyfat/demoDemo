//
//  DetailShopView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class DetailShopView: UIView {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var selecctedStar: UIButton!
    
    @IBOutlet weak var cashbackValue: UILabel!
    
    @IBOutlet weak var progressieveView: UIProgressView!
    @IBOutlet weak var rateDislike: UILabel!
    @IBOutlet weak var rateLike: UILabel!
    @IBOutlet weak var cashbackCurrency: UILabel!
    @IBOutlet weak var cashbackTimeLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
}
