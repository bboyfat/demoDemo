//
//  MainProfileViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class MainPageViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControll: UIPageControl!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var banners = BannersViewModel().banners
    
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
        collectionView.delegate = self
        collectionView.dataSource = self
        setPages()
        mainPageView.photoImageView.parent = self
        addGestureToMap()
        mainPageView.scrollView.addSubview(refreshControl)
        addTapToBalance()
        addTapToPending()
        
    }
  
    func addGestureToMap(){
        let tap = UITapGestureRecognizer()
        mainPageView.mapImageView.isUserInteractionEnabled = true
        tap.addTarget(self, action: #selector(presentMap))
        mainPageView.mapImageView.addGestureRecognizer(tap)
        }
    @objc func presentMap(){
        let vc = UIStoryboard(name: "Map", bundle: nil).instantiateViewController(withIdentifier: "mapVc") as! MapViewController
        present(vc, animated: true, completion: nil)
        }
    
    
    
    
    func addTapToBalance(){
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(presentWD))
        mainPageView.balanceStack.addGestureRecognizer(tap)
    }
    func addTapToPending(){
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(presentPurchase))
        mainPageView.pendingStack.addGestureRecognizer(tap)
    }
    
   @objc func presentWD(){
        let vc = UIStoryboard(name: "WithDrawal", bundle: nil).instantiateViewController(withIdentifier: "withdrawalVc") as! WDViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func otherCardsBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "OtherCards", bundle: nil).instantiateViewController(withIdentifier: "otherCardVc") as! OtherCardsController
        present(vc, animated: true, completion: nil)
    }
    @objc func presentPurchase(){
        let vc = UIStoryboard(name: "OperationHistory", bundle: nil).instantiateViewController(withIdentifier: "operationVC") as! OperationHistoryController
        
        self.present(vc, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        mainPageView.scrollView.scrollsToTop = true
        
    }
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
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
    
    
    @IBAction func purchBtn(_ sender: UIButton) {
//        presentPurchase()
    }
    @IBAction func wdBtn(_ sender: UIButton) {
//        presentWD()
    }
    @IBAction func balanceInfoBtn(_ sender: UIButton) {
        infoAlert().presentAlert(view: self, title: balanceMassege)
    }
    @IBAction func pendingBalanceInfoBtn(_ sender: UIButton) {
        infoAlert().presentAlert(view: self, title: pendingBalanceMassege)
    }
    
    @IBAction func showMyCodeBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "BarCode", bundle: nil).instantiateViewController(withIdentifier: "BarCodeVC")
        self.present(vc, animated: true) {
            UIView.animate(withDuration: 0.3, animations: {
                UIScreen.main.brightness = 1.0
            })
        }
        
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.panGestureRecognizer.translation(in: scrollView.superview).y < -10{
            let vc = UIStoryboard(name: "Map", bundle: nil).instantiateViewController(withIdentifier: "mapVc") as! MapViewController
            
            present(vc, animated: true) {
                scrollView.scrollsToTop = true
                scrollView.contentOffset = CGPoint(x: 0, y: 0)
            }
        }
        
        
    }
    
    @IBAction func notificationsBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotificationsMain", bundle: nil).instantiateViewController(withIdentifier: "notificationsVC") as! MainNotificationsController
        
        
        present(vc, animated: true, completion: nil)
    }
    func setPages(){
        pageControll.numberOfPages = banners.count
        pageControll.currentPage = 0
    }
    
}

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! MainPageBannerCell
        let banner = banners[indexPath.item]
        cell.bannerImageView.image = banner.image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControll.currentPage = indexPath.item
        
    }
    
    
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}
