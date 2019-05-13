//
//  AccountViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
//    let accountView = AccountView()
    @IBOutlet weak var accountView: AccountView!
    var avatarImage: UIImage?
    var avatarModel: AvatarViewModel = AvatarViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setAvatar(view: accountView.profilePhoto)
       
    }
    
    func setAvatar(view: UIImageView){
       avatarImage = avatarModel.fetchImage()
        if avatarImage != nil{
            view.image = avatarImage
        } else {
            view.image = #imageLiteral(resourceName: "man")
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    

    @IBAction func showHistoryButton(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "OperationHistory", bundle: nil).instantiateViewController(withIdentifier: "operationVC") as! OperationHistoryController
        
        present(vc, animated: true, completion: nil)
    }
    @IBAction func notificationsBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotificationsMain", bundle: nil).instantiateViewController(withIdentifier: "notificationsVC") as! MainNotificationsController
        
        present(vc, animated: true, completion: nil)
    }
    @IBAction func withdrawalBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "WithDrawal", bundle: nil).instantiateViewController(withIdentifier: "withdrawalVc") as! WDViewController
        present(vc, animated: true, completion: nil)
    }
    @IBAction func profileSettingsScreen(_ sender: UIButton) {
        let vc = UIStoryboard(name: "ProfileSettScreen", bundle: nil).instantiateViewController(withIdentifier: "ProfileSettingsVC") as! ProfileSetController
        
        present(vc, animated: true) {
            self.setAvatar(view: vc.settingsView.avatarView)
        }
    }
    
}

