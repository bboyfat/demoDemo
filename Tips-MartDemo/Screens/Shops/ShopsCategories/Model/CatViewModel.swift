//
//  CatViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/31/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

protocol CatViewModelDelegate{
    var isMore: Bool {get set}
    var cellDataModel: [CategoriesCellDataModel] { get set}
    func cellForRow(_ tableView: UITableView, indexPath: IndexPath, categories: [CategoriesCellDataModel]) -> UITableViewCell
    func didSelectRow(_ tableView: UITableView,_ indexPath: IndexPath, tableViewHeight: NSLayoutConstraint, categories: [CategoriesCellDataModel])
    func numberOfRows(_ tableView: UITableView,_ section: Int, categories: [CategoriesCellDataModel]) -> Int
    func numberOfSections(_ tableVIew: UITableView, categories: [CategoriesCellDataModel]) -> Int
    func heightForHeader(_ tableVIew: UITableView ,section: Int) -> CGFloat
    func heightForFootter(_ tableVIew: UITableView ,section: Int, categories: [CategoriesCellDataModel]) -> CGFloat
    func titleForHeader(_ tableView: UITableView, titleFor section: Int, title: String) -> String?
    func viewForFooter(_ tableVIew: UITableView ,section: Int) -> UIView?
    
}

class CatViewModel: CatViewModelDelegate{
    
    var cellDataModel: [CategoriesCellDataModel] = []
    
    var isMore: Bool = false
    
    
    
    var categoriesData: CategoriesDataDelegate = CategoriesData()
    
    
    
    private func registerCellNib(_ tableView: UITableView, nibName: String, identifier: String){
        let nib = UINib.init(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    
    func cellForRow(_ tableView: UITableView, indexPath: IndexPath, categories: [CategoriesCellDataModel]) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "categorieCell") as? SubCategoriCell else {return UITableViewCell()}
            cell.categorieLabel.text = categories[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rowsCatCell") as? RowsCatCell else {return UITableViewCell()}
            cell.categoriesLabel.text = categories[indexPath.section].childsTitle[indexPath.row - 1].name
            return cell
        }
    }
    
    func didSelectRow(_ tableView: UITableView,_ indexPath: IndexPath, tableViewHeight: NSLayoutConstraint, categories: [CategoriesCellDataModel]) {
        if indexPath.row == 0{
            //            categories[indexPath.section].opened = !categories[indexPath.section].opened
            if categories[indexPath.section].opened{
                tableViewHeight.constant += (CGFloat(35.5) * CGFloat(categories[indexPath.section].childsTitle.count))
                UIView.animate(withDuration: 0.3) {
                }
                
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)
            } else {
                tableViewHeight.constant -= (CGFloat(35.5) * CGFloat(categories[indexPath.section].childsTitle.count))
                UIView.animate(withDuration: 0.3) {
                }
                let sections = IndexSet(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)
                
            }
        }
    }
    
    func numberOfRows(_ tableView: UITableView,_ section: Int, categories: [CategoriesCellDataModel]) -> Int {
        if categories[section].opened{
            tableView.beginUpdates()
            tableView.endUpdates()
            return categories[section].childsTitle.count + 1
        } else {
            return 1
        }
        
    }
    
    func numberOfSections(_ tableView: UITableView, categories: [CategoriesCellDataModel]) -> Int {
        registerCellNib(tableView, nibName: "SubCategoriCell", identifier: "categorieCell")
        registerCellNib(tableView, nibName: "RowsCatCell", identifier: "rowsCatCell")
        if isMore{
            return categories.count
        } else {
            return 5
        }
    }
    
    func heightForHeader(_ tableVIew: UITableView ,section: Int) -> CGFloat {
        if section == 0{
            return 30
        } else {
            return 0
        }
    }
    
    func heightForFootter(_ tableVIew: UITableView ,section: Int, categories: [CategoriesCellDataModel]) -> CGFloat {
        if isMore{
            if section == categories.count - 1{
                return 30
            } else {
                return 0
            }
        } else {
            if section == 4{
                return 30
            } else {
                return 0
            }
        }
    }
    
    
    
    func titleForHeader(_ tableView: UITableView, titleFor section: Int, title: String) -> String? {
        if section == 0{
            return title
        } else {
            return nil
        }
    }
    
    func viewForFooter(_ tableVIew: UITableView ,section: Int) -> UIView? {
        let viewForFooter: FooterForCategories = {
            let view = FooterForCategories()
            view.frame = tableVIew.tableFooterView?.bounds ?? CGRect(x: 0, y: 0, width: 400, height: 30)
            return view
        }()
        
        if isMore{
            if section == tableVIew.numberOfSections - 1 {
                return viewForFooter
            } else{
                return nil
            }
        } else {
            if section == 4{
                return viewForFooter
            }else{
                return nil
            }
        }
    }
    
    
    
}
