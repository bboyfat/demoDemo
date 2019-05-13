//
//  ProfileSetController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ProfileSetController: UIViewController {
    
    @IBOutlet var settingsView: ProfileSettingsView!
    
    //MARK: User Data model
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

       getInfo()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moveUp()
    }
    func getInfo(){
        if let userDataBase = LogOutputViewModel().fetchData(){
            settingsView.birthDayTextField.text = userDataBase.birthDay
            settingsView.nameTextField.text = userDataBase.name
            settingsView.surnameTextField.text = userDataBase.surname
        }
        
    }
    
    func moveUp(){
        self.settingsView.birthDayTextField.didCreated()
        self.settingsView.nameTextField.didCreated()
        self.settingsView.surnameTextField.didCreated()
        
    }

    @IBAction func closeVc(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            
        }
    }
    

}
