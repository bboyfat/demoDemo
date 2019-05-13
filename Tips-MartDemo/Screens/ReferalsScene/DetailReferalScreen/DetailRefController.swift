//
//  DetailRefController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/11/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

enum FriendsType{
    case friends
    case acquaintances
    case strangers
}

class DetailRefController: UIViewController {
    
    var friendsType: FriendsType = .friends{
        didSet{
            self.detRefTableView.reloadData()
        }
    }

    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    @IBOutlet var detRefTableView: UITableView!
    @IBOutlet var detRefView: DetRefView!
    
    var friendsArray: [DetailCellModel] = [DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Участников", valueText: "16 человек"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Зачислено", valueText: "1283,33 грн"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Операций", valueText: "20"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "В ожидании", valueText: "823,33 грн")]
    var acquaintancesArray: [DetailCellModel] = [DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Участников", valueText: "20 человек"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Зачислено", valueText: "183,83 грн"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Операций", valueText: "34"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "В ожидании", valueText: "523,33 грн")
    ]
    var strangesrArray: [DetailCellModel] = [DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Участников", valueText: "30 человек"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Зачислено", valueText: "83,55 грн"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Операций", valueText: "20"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "В ожидании", valueText: "422,33 грн")
        ]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func friendsBtnAct(_ sender: UIButton) {
        friendsType = .friends
        let viewsToHide = [detRefView.acqUnderscore, detRefView.strangUnderscore]
        let viewsToShow = [detRefView.frUnderscore]
        HideOrNot().hide(views: viewsToHide as! [UIView])
        HideOrNot().show(views: viewsToShow as! [UIView])
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func acqBtnAct(_ sender: UIButton) {
        friendsType = .acquaintances
        let viewsToHide = [detRefView.strangUnderscore, detRefView.frUnderscore]
        let viewsToShow = [detRefView.acqUnderscore]
        
        HideOrNot().hide(views: viewsToHide as! [UIView])
        HideOrNot().show(views: viewsToShow as! [UIView])
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func strangBtnAct(_ sender: UIButton) {
        friendsType = .strangers
        let viewsToHide = [detRefView.acqUnderscore, detRefView.frUnderscore]
        let viewsToShow = [detRefView.strangUnderscore]
        HideOrNot().hide(views: viewsToHide as! [UIView])
        HideOrNot().show(views: viewsToShow as! [UIView])
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func returnBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            
        }
    }
    
    
    

}


extension DetailRefController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableViewHeight.constant = CGFloat(friendsArray.count * 61)
        return friendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detRefCell", for: indexPath) as! DetaileRefCell
        let data: DetailCellModel?
        
        switch friendsType {
        case .friends: data = friendsArray[indexPath.row]
        case .acquaintances: data = acquaintancesArray[indexPath.row]
        case .strangers: data = strangesrArray[indexPath.row]
         }
        if let data = data{
        cell.cellImageView.image = data.image
        cell.catLbl.text = data.catText
        cell.valueLbl.text = data.valueText
        cell.selectionStyle = .none
        }
        return cell
    }
    
    
    
    
}
