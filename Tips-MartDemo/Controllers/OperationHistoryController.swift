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
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func dissmisView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


extension OperationHistoryController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = operatinHistoryView.myTableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
        
        return cell
    }
    
    
}
