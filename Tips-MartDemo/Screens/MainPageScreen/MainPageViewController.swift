//
//  MainProfileViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class MainPageViewController: UIViewController, UIScrollViewDelegate {
    
    
    
    var avatarImage: UIImage?
    var avatarModel: AvatarViewModel = AvatarViewModel()
    
    @IBOutlet var mainPageView: MainPageView!
    var refreshControl: UIRefreshControl!
    
    let accesToken = UserDefaults.standard.string(forKey: "accessToken")
    
    var infoModel: UsersOutput = UsersOutput()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainPageView.scrollView.delegate = self
        mainPageView.scrollView.alwaysBounceVertical = true
        mainPageView.scrollView.bounces  = true
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        mainPageView.scrollView.addSubview(refreshControl)
        setAvatar(view: mainPageView.photoImageView)
        
    }
    
    func setAvatar(view: UIImageView){
        avatarImage = avatarModel.fetchImage()
        if avatarImage != nil{
            view.image = avatarImage
        } else {
            view.image = #imageLiteral(resourceName: "man")
        }
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        refreshControl.endRefreshing()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    @objc func didPullToRefresh() {
        
        RefreshToken().getBalance(header: accesToken!) { (notif) in
            
        }
        guard let greenBalance = UserDefaults.standard.string(forKey: "greenBalance"),
            let grayBalance = UserDefaults.standard.string(forKey: "grayBalance") else {return}
        self.mainPageView.greenBalance.text = greenBalance + " грн."
        self.mainPageView.grayBalance.text = grayBalance + " грн."
        refreshControl?.endRefreshing()
        
        
    }
    
    @IBAction func showMyCodeBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "BarCode", bundle: nil).instantiateViewController(withIdentifier: "BarCodeVC")
        print("showMyCodeBtn")
        self.present(vc, animated: true) {
            UIView.animate(withDuration: 0.3, animations: {
                UIScreen.main.brightness = 1.0
            })
        }
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).y < 0{
            let vc = UIStoryboard(name: "Map", bundle: nil).instantiateViewController(withIdentifier: "mapVc") as! MapViewController
            
            present(vc, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func notificationsBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotificationsMain", bundle: nil).instantiateViewController(withIdentifier: "notificationsVC") as! MainNotificationsController
        
        
        present(vc, animated: true, completion: nil)
    }
    
}
