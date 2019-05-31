//
//  MainNotificationsController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift
class MainNotificationsController: UIViewController {
    @IBOutlet var notificationView: MainNotificationView!
    
    var notifications: [NotificationModelRealm] = []
    var notificationArray: [NotificationModelRealm] = []
    var operationArray: [NotificationModelRealm] = []
    var newsArray: [NotificationModelRealm] = []
    var specialsArray: [NotificationModelRealm] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setArrays()
        checkBadges()
        setViews()
        
        
    }
    
    func setViews(){
        
        
        // setup Date
        notificationView.operatinsDate.text = setUpDate(string: operationArray.last?.created ?? " ")
        notificationView.notificationsDate.text = setUpDate(string: notificationArray.last?.created ?? " ")
        notificationView.newsDate.text = setUpDate(string: newsArray.last?.created ?? " ")
        notificationView.specialProposeDate.text = setUpDate(string: specialsArray.last?.created ?? " ")
        
        // setup TextMessage
        
        notificationView.operationMessage.text = parseHtml(htmlString: operationArray.last?.text ?? " ")
        notificationView.natificationsMessage.text = parseHtml(htmlString: notificationArray.last?.text ?? " ")
        notificationView.newsMessage.text = parseHtml(htmlString: newsArray.last?.text ?? " ")
        notificationView.specialProposeMessage.text = parseHtml(htmlString: specialsArray.last?.text ?? " ")
        
        
    }
    func setArrays(){
        notifications.forEach { (notification) in
            if notification.kind == 1{
                self.notificationArray.append(notification)
            } else if notification.kind == 2{
                self.operationArray.append(notification)
            } else if notification.kind == 3{
                self.newsArray.append(notification)
            } else if notification.kind == 4{
                self.specialsArray.append(notification)
            }
        }
    }
    
    @IBAction func disVc(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func presentSpecTableView(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotifTable", bundle: nil).instantiateViewController(withIdentifier: "notTableVc") as! NotTableViewController
        vc.navigationController?.title = "Специальные предложения"
        vc.notifications = specialsArray
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func presentNewsTable(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotifTable", bundle: nil).instantiateViewController(withIdentifier: "notTableVc") as! NotTableViewController
        vc.navigationController?.title = "Новости"
        vc.notifications = newsArray
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func presentNotifTableView(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotifTable", bundle: nil).instantiateViewController(withIdentifier: "notTableVc") as! NotTableViewController
        vc.navigationController?.title = "Уведомления"
        vc.notifications = notificationArray
        present(vc, animated: true, completion: nil)
    }
    @IBAction func presentoperationsTable(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotifTable", bundle: nil).instantiateViewController(withIdentifier: "notTableVc") as! NotTableViewController
        
        vc.notifications = operationArray
        present(vc, animated: true, completion: nil)
    }
    func fetchData(){
        do{
            let realm = try Realm()
            self.notifications = Array(realm.objects(NotificationModelRealm.self))
         
            OperationQueue.main.addOperation {
               
                self.checkBadges()
            }
            
        } catch {
            print("Nothing to Fetch")
        }
    }
    
    func setUpDate(string: String) -> String{
        
        var dateString = string
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let datee = dateFormatterGet.date(from: dateString)
        dateString =  dateFormatterPrint.string(from: datee ?? Date())
        return dateString
    }
    func parseHtml(htmlString: String) -> String{
        
        return HTMLParser().parseHTML(htmlContent: htmlString)
    }
    
    func checkBadges(){
        if notifications.count > 0{
            self.notificationView.allBadge.setTitle(String(notifications.count), for: .normal)
            self.notificationView.allBadge.isHidden = false
        } else {
            self.notificationView.allBadge.isHidden = true
        }
        if notificationArray.count > 0{
            self.notificationView.notificationsBadge.setTitle(String(notificationArray.count), for: .normal)
            self.notificationView.notificationsBadge.isHidden = false
        } else {
            self.notificationView.notificationsBadge.isHidden = true
        }
        if operationArray.count > 0{
            self.notificationView.operationsBadge.setTitle(String(operationArray.count), for: .normal)
            self.notificationView.operationsBadge.isHidden = false
        } else {
            self.notificationView.operationsBadge.isHidden = true
        }
        if newsArray.count > 0{
            self.notificationView.newsBadge.setTitle(String(newsArray.count), for: .normal)
            self.notificationView.newsBadge.isHidden = false
        } else {
            self.notificationView.newsBadge.isHidden = true
        }
        if specialsArray.count > 0{
            self.notificationView.specialBadge.setTitle(String(specialsArray.count), for: .normal)
            self.notificationView.specialBadge.isHidden = false
        } else {
            self.notificationView.specialBadge.isHidden = true
        }
        
        
        
    }
    
    
    
}
