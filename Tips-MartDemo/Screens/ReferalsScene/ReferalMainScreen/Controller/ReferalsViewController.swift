//
//  ReferalsViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ReferalsViewController: UIViewController {
    
   
    @IBOutlet var referalsView: ReferalView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBAction func detailsBtn(_ sender: UIButton) {
       
    }
    @IBAction func friendsBtn(_ sender: UIButton) {
        presentDetails(.friends)
    }
    // share button
    
    @IBAction func shareButtonAction(_ sender: Any) {
       presentActivityControler(text: ["Helooou"])
    }
    #warning("Dont forget to made a new class foar activity controller")
    func presentActivityControler(text: [Any]){
        let textToShare = text
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.postToTwitter, UIActivity.ActivityType.copyToPasteboard ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    func presentDetails(_ type: FriendsType){
        let vc = UIStoryboard(name: "DetailReferalScreen", bundle: nil).instantiateViewController(withIdentifier: "DetaiRefVc") as! DetailRefController
        vc.friendsType = type
        present(vc, animated: true) {
            
        }
    }
    // MARK: Info buttons stack
    
    @IBAction func strangerInfoBtn(_ sender: UIButton) {
        InfoAlert().presentAlert(view: self, title: strangersInfoMessage)
        
    }
    @IBAction func familiarInfoBtn(_ sender: UIButton) {
        InfoAlert().presentAlert(view: self, title: familiarInfoMessage)
    }
    @IBAction func friendsInfoBtn(_ sender: UIButton) {
        InfoAlert().presentAlert(view: self, title: friendsInfoMessage)
    }
    
}



    
    
    
    
    
    

