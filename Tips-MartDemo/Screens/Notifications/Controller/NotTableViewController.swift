//
//  NotTableViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift

class NotTableViewController: UIViewController {
    
    @IBOutlet var notificationView: NotifTableView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var navItem: UINavigationItem!
    
    let accessToken = UserDefaults.standard.string(forKey: "accessToken")
    
    var notifications: [NotificationModelRealm] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        myTableView.rowHeight = UITableView.automaticDimension
        
        
        if let accessToken = accessToken{
            
            RefreshToken().getBalance(header: accessToken) { (notifications) in
                
        }
        }

    }

       
    
    
    @IBAction func disVc(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    
    
    

}

extension NotTableViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(notifications.count)
       let cell = tableView.dequeueReusableCell(withIdentifier: "notCell", for: indexPath) as! NotoficationCell
       let notification = notifications[indexPath.row]
        
        let info = HTMLParser().parseHTML(htmlContent: notification.text)
        let dateString = dateTostring(date: notification.created)
        
        
        
        cell.textNotifLabel.attributedText = attributedNotificationText(text: info)
        cell.dateLabel.text = dateString
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if action == #selector(cut(_:)) {
            return true
        }
        if action == #selector(paste(_:)) {
            return true
        }
        if action == #selector(copy(_:)){
            return true
        }
        presentActionSheet(indexPath: indexPath)
        return super.canPerformAction(action, withSender: sender)
       
    }
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        
        if action == #selector(UIResponderStandardEditActions.copy){
            UIPasteboard.general.string = HTMLParser().parseHTML(htmlContent: notifications[indexPath.row].text)
        }
       
        
    }

    
    func dateTostring(date: String) -> String{
       var dateString = date
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = dateFormatterGet.date(from: dateString)
        dateString =  dateFormatterPrint.string(from: date ?? Date())
        
        return dateString
    }
    
    func attributedNotificationText(text: String) -> NSAttributedString{
        
        let attributedString = NSMutableAttributedString(string: text)
        
        // *** Create instance of 'NSMutableParagraphStyle'
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 7 // Whatever line spacing you want in points
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        // *** Set Attributed String to your label ***
        return attributedString
        
    }
    func presentActionSheet(indexPath: IndexPath){
        let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let shareAction = UIAlertAction(title: "Поделиться", style: .default) { (_) in
            self.presentActivityControler(text: [HTMLParser().parseHTML(htmlContent: self.notifications[indexPath.row].text)])
        }
        let copyaction = UIAlertAction(title: "Скопировать", style: .default) { (_) in
             UIPasteboard.general.string = HTMLParser().parseHTML(htmlContent: self.notifications[indexPath.row].text)
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { (_) in
            
        }
        action.addAction(shareAction)
        action.addAction(copyaction)
        action.addAction(deleteAction)
        
        
        self.present(action, animated: true, completion: nil)
    }
    func presentActivityControler(text: [Any]){
        let textToShare = text
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
}
