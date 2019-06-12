////
////  ServicesTableController.swift
////  Tips-MartDemo
////
////  Created by Andrey Petrovskiy on 5/31/19.
////  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
////
//
//import UIKit
//
//class ServicesTableController: NSObject {
//    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!{
//        didSet{
//            UIView.animate(withDuration: 0.3) {
//                
//            }
//        }
//    }
//    @IBOutlet weak var categoriesTableView: UITableView!
//    
//    var categories: [CategoriesCellDataModel] = CategoriesData().throwData(categorieType: .services)
//    
//    
//    var viewModel: CatViewModelDelegate = CatViewModel()
//    
//    var filter: [Int] = []
//   
//    
//    
//    
//    @objc func handleShowMore(){
//        print("Services")
//    }
//    
//    
//    
//    
//    
//    
//}
//extension ServicesTableController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//       
//        
//        return viewModel.cellForRow(tableView, indexPath: indexPath, categories: categories)
//    }
//    
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        print(tableView.rowHeight)
//        return viewModel.numberOfSections(tableView, categories: categories)
//    }
//
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.numberOfRows(tableView, section, categories: categories)
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        categories[indexPath.section].opened = !categories[indexPath.section].opened
//        
//        
//        
//        if indexPath.row == 0{
//            let mainCat = categories[indexPath.section].categoriID
//            removeCategory(number: mainCat, indexPath: indexPath)
//            appendCategory(number: mainCat)
//            
//        } else {
//            let subCategorie = categories[indexPath.section].childsTitle[indexPath.row - 1].categoryID
//            removeCategory(number: subCategorie, indexPath: indexPath)
//            appendCategory(number: subCategorie)
//        }
//        viewModel.didSelectRow(tableView, indexPath, tableViewHeight: tableViewHeight, categories: categories)
//    }
//    func appendCategory(number: Int){
//        if filter.count > 0{
//            filter.forEach { (num) in
//                if number != num{
//                    self.filter.append(number)
//                    return
//                }
//            }} else if filter.count == 0{
//            self.filter.append(number)
//            return
//        }
//        
//        let set = Set(filter)
//        filter = Array(set)
//        print("Set",set)
//        print("Filter", filter)
//        
//    }
//    func removeCategory(number: Int, indexPath: IndexPath){
//        if filter.contains(number){
//            self.filter.remove(at: indexPath.row)
//        }
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return viewModel.heightForFootter(tableView, section: section, categories: categories)
//        
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        
//        return viewModel.heightForHeader(tableView, section: section)
//    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return viewModel.titleForHeader(tableView, titleFor: section, title: "Услуги")
//    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        
//        let view = viewModel.viewForFooter(tableView, section: section) as? FooterForCategories
//        view?.showMoreBtn.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
//        
//        return view
//    }
//
//    @objc func handleTap(){
//        self.viewModel.isMore = !self.viewModel.isMore
//        if viewModel.isMore{
//            tableViewHeight.constant = 700
//            UIView.animate(withDuration: 0.3) {
//                self.categoriesTableView.layoutIfNeeded()
//                
//                self.categoriesTableView.reloadData()
//            }
//            
//        } else {
//            tableViewHeight.constant = 350
//            self.categoriesTableView.reloadData()
//        }
//        
//    }
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//       
//        view.tintColor = .clear
//        let header = view as! UITableViewHeaderFooterView
//        header.textLabel?.textColor = UIColor.darkGray
//        header.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
//    }
//    
//}
