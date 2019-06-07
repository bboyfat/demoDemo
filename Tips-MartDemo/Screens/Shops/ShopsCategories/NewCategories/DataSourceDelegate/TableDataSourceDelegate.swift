//
//  TableDataSourceDelegate.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/6/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//


import UIKit

enum SwithcForTable{
    case opened
    case closed
}

class TableDataSourceDelegate: NSObject, UITableViewDataSource {
    
    var isOpened = false
    var tableView: UITableView?
   
    var viewModel: CategoryViewModelDelegate!
    
     var contentHeight: (CGFloat) -> () = { _ in}
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let nib = UINib.init(nibName: "RowsCatCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "rowsCatCell")
        return viewModel.sectionsCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.getCategory(with: section).switchTable{
        case .opened: return viewModel.rowsCount(in: section)
        case .closed: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowsCatCell", for: indexPath) as! RowsCatCell
        cell.categoriesLabel?.text = viewModel.getCategory(with: indexPath.section).subCategories[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewForHeade = HeaderView()
        viewForHeade.tag = section
        viewForHeade.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30)
        viewForHeade.categoriLabel.text = viewModel.getCategory(with: section).name
        viewForHeade.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleOpen)))
        return viewForHeade
    }
    
    @objc func handleOpen(_ sender: UITapGestureRecognizer){
        isOpened = !isOpened
        if let view = sender.view as? HeaderView{
            
            if isOpened{
                viewModel.openClose(in: view.tag, opened: .opened)
                self.tableView?.reloadSections(IndexSet(integer: view.tag), with: .none)
            } else {
                viewModel.openClose(in: view.tag, opened: .closed)
                self.tableView?.reloadSections(IndexSet(integer: view.tag), with: .none)
            }
            contentHeight((tableView?.contentSize.height)!)
        }
    }
    override init() {
        super.init()
        
    }
    
    init(categoryType: CategorieType) {
        viewModel = CategoryViewModel(categoryType: categoryType)
       
    }
    
}

extension TableDataSourceDelegate: UITableViewDelegate{
    
    
}
