////
////  CategoriesController.swift
////  Tips-MartDemo
////
////  Created by Andrey Petrovskiy on 5/31/19.
////  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
////
//
//import UIKit
//
//struct ShopsTypes {
//    var type: String
//}
//
//
//
//class CategoriesController: UIViewController {
//    var 
//    var shopsTypes: [ShopsTypes] = [ShopsTypes(type: "Онлайн"), ShopsTypes(type: "Оффлайн"), ShopsTypes(type: "Все магазины")]
//     var filterDelegate: FilterCategoryDelegate?
//    
//    var categories: [Int] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let delegat1 = ProductsTableDelegate()
//        delegat1.tableview =  tableView1
//        delegate1.model = model1
//        tableView.delegate =
//        
//    }
//    @IBAction func dismissVc(_ sender: UIBarButtonItem) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    @IBAction func showShops(_ sender: UIButton) {
//        filterDelegate?.filter(categiries: categories)
//        dismiss(animated: true, completion: nil)
//    }
//}
//
//
//extension CategoriesController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return shopsTypes.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shopsTypeCell", for: indexPath) as? MainCategoriesCell else {return UITableViewCell()}
//        
//        cell.categoriesLabel.text = shopsTypes[indexPath.row].type
//        cell.selectionStyle = .none
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0{
//            
//            
//            return 20
//        } else {
//            return 0
//        }
//    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0{
//            
//            return "Тип магазина"
//        } else {
//            return nil
//        }
//    }
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        view.tintColor = .clear
//        let header = view as! UITableViewHeaderFooterView
//        header.textLabel?.textColor = UIColor.darkGray
//        header.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
//    }
//    
//}
