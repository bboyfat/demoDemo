//
//  UIView+FillSuperView.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/5/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//
import UIKit

extension UIView {
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
}
