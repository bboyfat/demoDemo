//
//  NotTableViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class NotTableViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    let accessToken = UserDefaults.standard.string(forKey: "accessToken")
    
    var notifications: [NotificationModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let accessToken = accessToken{
            
            RefreshToken().getBalance(header: accessToken) { (notifications) in
              
                self.notifications = notifications
                
                OperationQueue.main.addOperation {
                    self.myTableView.reloadData()
                }
                print("\(notifications)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            }
        }
        

        print(notifications)
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
        var dateString = notification.created
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let datee = dateFormatterGet.date(from: dateString)
        dateString =  dateFormatterPrint.string(from: datee ?? Date())
        print(dateString)
        
        cell.textNotifLabel.text = info
        cell.dateLabel.text = dateString
        
        
        return cell
    }
    
    
}
