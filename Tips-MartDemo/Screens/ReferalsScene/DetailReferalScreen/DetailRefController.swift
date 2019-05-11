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
    
    var array: [DetailCellModel] = [DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Участников", valueText: "16 xеловек"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Зачислено", valueText: "1283,33 грн"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "Операций", valueText: "20"), DetailCellModel(image: #imageLiteral(resourceName: "members"), catText: "В ожидании", valueText: "823,33 грн")]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func returnBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            
        }
    }
    

}


extension DetailRefController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableViewHeight.constant = CGFloat(array.count * 61)
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detRefCell", for: indexPath) as! DetaileRefCell
        let data = array[indexPath.row]
        
        cell.cellImageView.image = data.image
        cell.catLbl.text = data.catText
        cell.valueLbl.text = data.valueText
        
        
        return cell
    }
    
    
    
    
}
