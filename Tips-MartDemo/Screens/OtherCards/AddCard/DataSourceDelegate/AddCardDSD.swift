//
//  AddCardDSD.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/14/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class AddCardDSD: NSObject, UITableViewDataSource{
    
    var viewModel: AddCardViewModelProtocol!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionsCount()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCount(with: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath) 
        let model = viewModel.getModel(withIndexPath: indexPath)
        cell.textLabel?.text = model.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForeHeader(with: section)
    }
    
    
    override init() {
        viewModel = AddCardViewModel()
    }
    
}
