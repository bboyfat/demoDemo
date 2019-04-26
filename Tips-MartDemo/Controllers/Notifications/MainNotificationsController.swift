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
        vc.notifications = specialsArray
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func presentNewsTable(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotifTable", bundle: nil).instantiateViewController(withIdentifier: "notTableVc") as! NotTableViewController
        vc.notifications = newsArray
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func presentNotifTableView(_ sender: UIButton) {
        let vc = UIStoryboard(name: "NotifTable", bundle: nil).instantiateViewController(withIdentifier: "notTableVc") as! NotTableViewController
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
            //        print(shopsModelArray[0].currency)
            OperationQueue.main.addOperation {
               self.view.reloadInputViews()
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
        print(dateString)
        return dateString
    }
    func parseHtml(htmlString: String) -> String{

        return HTMLParser().parseHTML(htmlContent: htmlString)
    }
    
    func checkBadges(){
        if notifications.count > 0{
            self.notificationView.allNotifBadge.isHidden = false
            self.notificationView.allNotifBadge.text = "\(notificationArray.count)"
        } else {
            self.notificationView.allNotifBadge.isHidden = true
        }
        if notificationArray.count > 0{
            self.notificationView.notifBadge.isHidden = false
            self.notificationView.notifBadge.text = "\(notificationArray.count)"
        } else if operationArray.count > 0{
            self.notificationView.operationBadge.isHidden = false
            self.notificationView.operationBadge.text = "\(operationArray.count)"
        } else if specialsArray.count > 0{
            self.notificationView.specialBadge.isHidden = false
            self.notificationView.specialBadge.text = "\(specialsArray.count)"
        } else if newsArray.count > 0{
            self.notificationView.newsBadge.isHidden = false
            self.notificationView.newsBadge.text = "\(newsArray.count)"
        } else {
            self.notificationView.notifBadge.isHidden = true
            self.notificationView.operationBadge.isHidden = true
            self.notificationView.specialBadge.isHidden = true
            self.notificationView.newsBadge.isHidden = true
        }
        
        
        
    }
    
    
    
}
