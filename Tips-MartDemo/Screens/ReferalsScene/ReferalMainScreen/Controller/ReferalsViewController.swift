//
//  ReferalsViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ReferalsViewController: UIViewController {

    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var refTableView: UITableView!
    @IBOutlet var referalsView: ReferalView!
    
    let cellModel: [CellModel] = [CellModel(image: #imageLiteral(resourceName: "reffriends"), btnText: "Друзья", infoText: "450 человек"),CellModel(image: #imageLiteral(resourceName: "shopping-cart-1"), btnText: "Знакомые", infoText: "100 человек"), CellModel(image: #imageLiteral(resourceName: "farfar"), btnText: "Незнакомцы", infoText: "45 человек")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBAction func detailsBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "DetailReferalScreen", bundle: nil).instantiateViewController(withIdentifier: "DetaiRefVc") as! DetailRefController
        
        present(vc, animated: true) {
            
        }
    }
    
    func addRefCell(){
      

    }

}

extension ReferalsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewHeight.constant = CGFloat(cellModel.count * 61)
        return cellModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = refTableView.dequeueReusableCell(withIdentifier: "refCell", for: indexPath) as! ReferalsViewCell
         let data = cellModel[indexPath.row]
        cell.refImageView.image = data.image
       
     
        cell.frLbl.text = data.btnText
        cell.infoBtn.setImage(#imageLiteral(resourceName: "information копія"), for: .normal)
        cell.infoLbl.text = data.infoText
      
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    
    
    
    
}
