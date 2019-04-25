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
    
    @IBOutlet weak var myTableView: UITableView!
    let accessToken = UserDefaults.standard.string(forKey: "accessToken")
    
    var notifications: [NotificationModelRealm] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let accessToken = accessToken{
            
            RefreshToken().getBalance(header: accessToken) { (notifications) in
                
        }
        }
        fetchDataFromRealm()
    }

       
    
    
    @IBAction func disVc(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func fetchDataFromRealm(){
        do{
            let realm = try Realm()
            
            self.notifications = Array(realm.objects(NotificationModelRealm.self))
            //        print(shopsModelArray[0].currency)
            OperationQueue.main.addOperation {
                self.myTableView.reloadData()
            }
        } catch {
            print("Can't FETCH!!")
        }
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
        var dateString = notification.created
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let datee = dateFormatterGet.date(from: dateString)
        dateString =  dateFormatterPrint.string(from: datee ?? Date())
        print(dateString)
        
        cell.textNotifLabel.attributedText = attributedNotificationText(text: info)
        cell.dateLabel.text = dateString
        
        
        return cell
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
    
}
