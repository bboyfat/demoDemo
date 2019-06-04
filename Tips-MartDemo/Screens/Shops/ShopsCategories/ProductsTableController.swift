//
//  ProductsTableController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/31/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ProductsTableController: NSObject {
    
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!{
        didSet{
            UIView.animate(withDuration: 0.3) {
                self.productTableView.layoutIfNeeded()
            }
        }
    }
    var viewModel: CatViewModelDelegate = CatViewModel()
    var categories: [CategoriesCellDataModel] = CategoriesData().throwData(categorieType: .products)
    
    
    
}
extension ProductsTableController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return viewModel.cellForRow(tableView, indexPath: indexPath, categories: categories)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        print(tableView.rowHeight)
        return viewModel.numberOfSections(tableView, categories: categories)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(tableView, section, categories: categories)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categories[indexPath.section].opened = !categories[indexPath.section].opened
        viewModel.didSelectRow(tableView, indexPath, tableViewHeight: tableViewHeight, categories: categories)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return viewModel.heightForFootter(tableView, section: section, categories: categories)
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return viewModel.heightForHeader(tableView, section: section)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeader(tableView, titleFor: section, title: "Товары")
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = viewModel.viewForFooter(tableView, section: section) as? FooterForCategories
        view?.showMoreBtn.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        
        return view
    }
    
    @objc func handleTap(){
        self.viewModel.isMore = !self.viewModel.isMore
        if viewModel.isMore{
            tableViewHeight.constant = (CGFloat(categories.count) * CGFloat(75))
            UIView.animate(withDuration: 0.3) {
                self.productTableView.layoutIfNeeded()
                
                self.productTableView.reloadData()
            }
            
        } else {
            tableViewHeight.constant = 350
            UIView.animate(withDuration: 0.3) {
                self.productTableView.layoutIfNeeded()
                
                self.productTableView.reloadData()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .clear
        if let header = view as? UITableViewHeaderFooterView{
            header.textLabel?.textColor = UIColor.darkGray
            header.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        }
    }
}
