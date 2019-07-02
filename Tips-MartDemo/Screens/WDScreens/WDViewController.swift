//
//  WDViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class WDViewController: UIViewController {
    
    @IBOutlet var wdView: WDView!
    var isOpenWd = false
    var isOpenPhone = false
    @IBOutlet weak var detailHeight: NSLayoutConstraint!
    @IBOutlet weak var wdDetailView: DetailWDView!
    var detailViewModel: ViewModelForWdDetails!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel = ViewModelForWdDetails(view: wdDetailView)
    }
    
    @IBAction func showPhoneDetails(_ sender: Any) {
        isOpenPhone = !isOpenPhone
        if isOpenPhone{
        isOpenWd = false
        wdView.cardActivView.layer.borderWidth = 0
        wdView.phoneActiveView.layer.borderWidth = 2
        wdView.phoneActiveView.layer.borderColor = UIColor.purple.cgColor
        detailViewModel.setView(type: .phone)
        wdView.cardInfoLbl.text = ""
        animationTime()
        } else {
            wdView.cardActivView.layer.borderWidth = 0
            wdView.phoneActiveView.layer.borderWidth = 0
            detailViewModel.setView(type: .none)
            wdView.cardInfoLbl.text = ""
            animationTime()
        }
    }
    @IBAction func wdHistoryBtn(_ sender: UIButton) {
//       presentHIstory()
        wdView.cardActivView.layer.borderWidth = 0
        wdView.phoneActiveView.layer.borderWidth = 0
        detailViewModel.setView(type: .none)
        wdView.cardInfoLbl.text = ""
        animationTime()
        
        
    }
    @IBAction func showWdDetails(_ sender: Any) {
        isOpenWd = !isOpenWd
        if isOpenWd{
        isOpenPhone = false
        wdView.phoneActiveView.layer.borderWidth = 0
        wdView.cardActivView.layer.borderWidth = 2
        wdView.cardActivView.layer.borderColor = UIColor.purple.cgColor
        detailViewModel.setView(type: .card)
        wdView.cardInfoLbl.text = DataForDeatailsView().informationForCard
        animationTime()
        } else {
            wdView.cardActivView.layer.borderWidth = 0
            wdView.phoneActiveView.layer.borderWidth = 0
            detailViewModel.setView(type: .none)
            wdView.cardInfoLbl.text = ""
            animationTime()
        }
    }
    
    func presentHIstory(){
        let vc = UIStoryboard(name: "WDHistory", bundle: nil).instantiateViewController(withIdentifier: "wdHistoryVc") as! WDHistoryController
        present(vc, animated: true, completion: nil)
        
    }
    private func animationTime(){
        detailHeight.constant = wdDetailView.viewHeight.constant
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func operationHistory(_ sender: Any) {
        presentHIstory()
    }
    
    
}
