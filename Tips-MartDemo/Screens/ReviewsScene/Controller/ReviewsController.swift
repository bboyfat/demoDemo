//
//  ReviewsController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ReviewsController: UIViewController, ReviewsCellDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet var reviewView: ReviewsView!
    @IBOutlet weak var reviewTableView: UITableView!
    
    var lastContentOffset: CGFloat = 8
    func reviewsTableViewCell(_ reviewCell: ReviewCell) {
        view.layoutIfNeeded()
        reviewCell.isChanged = !reviewCell.isChanged
        UIView.animate(withDuration: 4) {
            self.view.layoutIfNeeded()
            if reviewCell.isChanged{
                  self.reviewTableView.beginUpdates()
                reviewCell.cellHeight.constant = 135
                reviewCell.xibHeight.constant = 0
              
                self.reviewTableView.endUpdates()
            } else {
                 self.reviewTableView.beginUpdates()
                reviewCell.cellHeight.constant = 350
                reviewCell.xibHeight.constant = 200
               
                self.reviewTableView.endUpdates()
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTap()
        let gradientView = GradientView(frame: reviewView.infoView.bounds)
        reviewView.infoView.insertSubview(gradientView, at: 0)
        
    }
    
    
    func addTap(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleEndEditing))
        view.addGestureRecognizer(tap)
    }
    @objc func handleEndEditing(){
        view.endEditing(true)
    }
    
    
}

extension ReviewsController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewsCell", for: indexPath) as! ReviewCell
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
        
    }
    
    
    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.lastContentOffset < scrollView.contentOffset.y) {
            
            self.animateOnscroll(constant: 0)
        } else if (self.lastContentOffset > scrollView.contentOffset.y) {
            print(scrollView.contentOffset.y)
            self.animateOnscroll(constant: 80)
        } else {
    
        }
    }
    
    func animateOnscroll(constant: CGFloat){
        self.view.layoutIfNeeded()
        self.reviewView.infoHeight.constant = constant
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    
    
}


