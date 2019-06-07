//
//  MainCategoriesController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/6/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MainCategoriesController: UIViewController {
    
    @IBOutlet weak var serviceTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var productTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var topTableView: UITableView!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var servicesTableView: UITableView!
    
    var isFullProdHeight = false
    var isFullServHeight = false
    
    var productTableViewDelegate: TableDataSourceDelegate?
    
    var servicesTableViewDelegate: TableDataSourceDelegate?
    
    var onlineTableViewDelegate: TableDataSourceDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTopTable()
        setProducts()
        setServices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(productsTableView.contentSize.height)
        changeHeight()
    }
    private  func setProducts(){
        productTableViewDelegate = TableDataSourceDelegate(categoryType: .products)
        productTableViewDelegate?.tableView = productsTableView
        productsTableView.delegate = productTableViewDelegate
        productsTableView.dataSource = productTableViewDelegate
    }
    private  func setServices(){
        servicesTableViewDelegate = TableDataSourceDelegate(categoryType: .services)
        servicesTableViewDelegate?.tableView = servicesTableView
        servicesTableView.delegate = servicesTableViewDelegate
        servicesTableView.dataSource = servicesTableViewDelegate
    }
    
    private func setTopTable(){
        onlineTableViewDelegate = TableDataSourceDelegate(categoryType: .online)
        onlineTableViewDelegate?.tableView = topTableView
        topTableView.delegate = onlineTableViewDelegate
        topTableView.dataSource = onlineTableViewDelegate
    }
    
    func changeHeight(){
        productTableViewDelegate!.contentHeight = {[weak self] in
            self?.productTableViewHeight.constant = $0
            UIView.animate(withDuration: 0.4) {
                self?.view.layoutIfNeeded()
            }
        }
        servicesTableViewDelegate!.contentHeight = {[weak self] in
            self?.serviceTableViewHeight.constant = $0
            UIView.animate(withDuration: 0.4) {
                self?.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func showProducts(_ sender: Any) {
        isFullProdHeight = !isFullProdHeight
        if let  delegate = productTableViewDelegate{
            if isFullProdHeight{
                productTableViewHeight.constant = (delegate.tableView?.contentSize.height)!
                UIView.animate(withDuration: 0.4) {
                    self.view.layoutIfNeeded()
                }
            } else {
                productTableViewHeight.constant = 220
                UIView.animate(withDuration: 0.7) {
                    self.view.layoutIfNeeded()
                }
            }
        }
        
    }
    @IBAction func showServices(_ sender: Any) {
        isFullServHeight = !isFullServHeight
        if let  delegate = servicesTableViewDelegate{
            if isFullServHeight{
                serviceTableViewHeight.constant = (delegate.tableView?.contentSize.height)!
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                }
            } else {
                serviceTableViewHeight.constant = 220
                UIView.animate(withDuration: 0.4) {
                    self.view.layoutIfNeeded()
                }
            }
        }
        
        
    }
    
}
