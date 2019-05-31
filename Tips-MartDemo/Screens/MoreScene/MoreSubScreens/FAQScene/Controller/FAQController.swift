//
//  FAQController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/30/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class FAQController: UIViewController {
    
    let viewModel = FAQViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dismissFAQ(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
       
}

extension FAQController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableView = tableView
        let nib = UINib.init(nibName: "FAQCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FAQCell")
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.FAQCell(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        present(viewModel.didSelectedRow(indexPath: indexPath), animated: true) {
            
        }
    }
}
