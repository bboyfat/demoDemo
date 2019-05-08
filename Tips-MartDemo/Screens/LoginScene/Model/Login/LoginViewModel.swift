//
//  LoginViewViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/8/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift

class LoginViewModel{
    
    var phoneNumber: String = ""
    var password: String = ""
    
    
    func saveUserData(){
        let loginData = LoginDataBase()
       
        loginData.setValue(self.password, forKey: "password")
        loginData.setValue(self.phoneNumber, forKey: "phoneNumber")
        //  userData.setValue(self.gender, forKey: "gender")
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(loginData)
            }
        } catch let saveErr{
            print("Can't save user's data", saveErr)
        }
    }
    
    func fetchDataFromRealm() -> LoginDataBase?{
        var loginData: LoginDataBase?
        
        let realm = try! Realm()
        let result = realm.objects(LoginDataBase.self)
        
        loginData = result.first
        return loginData
    }
    
    
    
}
