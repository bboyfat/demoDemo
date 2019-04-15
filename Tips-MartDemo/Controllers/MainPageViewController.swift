//
//  MainProfileViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    
  
    
    let mainView = MainPageView()
    var infoModel: RegModelGet = RegModelGet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.frame = self.view.bounds
      self.view.addSubview(mainView)
        
      
       
        stUpdata()
        print(infoModel.data?.name, "MAINPAGEVIEWCONTROLLER!!!!!!!!!")
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        stUpdata()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      stUpdata()
    }
    
   
    
    func stUpdata(){
//        guard let name = self.infoModel.data?.name else { return }
//        guard let surname = self.infoModel.data?.surname  else { return }
//        if let nameLabel = mainView.nameSurnameLabel, let idLabel = mainView.idLabel {
//             nameLabel.text = ( name + " " + surname)
//  
//        guard let id = self.infoModel.data?.userid else { return }
//        idLabel.text = "ID" + "\(id)"
//        }
     
    }
}
