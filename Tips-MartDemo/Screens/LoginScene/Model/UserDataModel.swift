//
//  LoginViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/7/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift

enum Gender: String{
    case male = "male"
    case female = "female"
}

class UserDataModel{
    
    var phoneNumber: String = ""
    var password: String = ""
    var name: String = ""
    var secondName: String = ""
    var birthDay: Double = 0.0
    var authCode: Int = 0
    
    func saveUserData(){
        let userData = UserData()
        userData.setValue(self.name, forKey: "name")
        userData.setValue(self.secondName, forKey: "secondName")
        userData.setValue(String(self.birthDay), forKey: "birthDay")
        userData.setValue(self.password, forKey: "password")
        userData.setValue(self.phoneNumber, forKey: "phoneNumber")
      
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(userData)
            }
        } catch let saveErr{
            print("Can't save user's data", saveErr)
        }
    }
    
    func fetchDataFromRealm() -> UserData?{
        var userData: UserData?
        
        let realm = try! Realm()
        let result = realm.objects(UserData.self)
        
        userData = result.first
        return userData
    }
    
    
   
}
