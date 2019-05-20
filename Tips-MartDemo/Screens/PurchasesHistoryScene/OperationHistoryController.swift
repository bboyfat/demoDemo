//
//  OperationHistoryController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class OperationHistoryController: UIViewController {
    
    @IBOutlet var operatinHistoryView: OperationHistoryView!
    var itemsForRows: [Purchases] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else {return}
        OperationHistoryAPI().getHistory(header: accessToken, urlString: URLS.purchasesInfo.rawValue) { (history) in
            self.itemsForRows = history.purchases
            OperationQueue.main.addOperation {
                self.operatinHistoryView.myTableView.reloadData()
            }
            
        }
    }
    
    @IBAction func dissmisView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


extension OperationHistoryController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //itemsForRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = operatinHistoryView.myTableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
//        let item = itemsForRows[indexPath.row]
//        let info = HTMLParser().parseHTML(htmlContent: item.description)
//        var stringDate = item.created
//
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = "dd.MM.yyyy HH:mm:ss"
//        let datee = dateFormatterGet.date(from: stringDate)
//        stringDate =  dateFormatterPrint.string(from: datee ?? Date())
//        print(stringDate)
//
//        cell.dateLabel.text = stringDate
//        cell.orderInfoLabel.text = info
//        if item.status == 0{
//            cell.totalCashbackLabel.textColor = .orange
//            cell.cahsbackStatusLabel.textColor = .orange
//            cell.cahsbackStatusLabel.text = "в ожидании"
//        } else if item.status == 1{
//            cell.totalCashbackLabel.textColor = .red
//            cell.cahsbackStatusLabel.textColor = .red
//            cell.cahsbackStatusLabel.text = "отменее"
//        } else if item.status == 2{
//            cell.totalCashbackLabel.textColor = #colorLiteral(red: 0, green: 0.8052297235, blue: 0.4442411065, alpha: 1)
//            cell.cahsbackStatusLabel.textColor = #colorLiteral(red: 0, green: 0.8052297235, blue: 0.4442411065, alpha: 1)
//            cell.cahsbackStatusLabel.text = "зачислено"
//        }
//        cell.totalCashbackLabel.text = String(item.sumCashback) + " грн"
        
        return cell
    }
    
    
}
