//
//  LoginViewViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/8/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift

class LoginViewModel: LoginModelType, Codable{
   
    
    
    var phoneNumber: String = ""
    var password: String = ""
    
    
    func saveUserData(){
        let loginData = LoginDataBase()
        loginData.setValue(self.password, forKey: "password")
        loginData.setValue(self.phoneNumber, forKey: "phoneNumber")
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(loginData)
            }
        } catch let saveErr{
            print("Can't save user's data", saveErr)
        }
    }
    
    func cleraUserData(){
        let realm = try! Realm()
        let objectToDelete = realm.objects(LoginDataBase.self)
        if objectToDelete.count > 1{
        do{
           try realm.write {
               realm.delete(objectToDelete)
            }
        } catch let clearErr{
            print("Can't remove", clearErr)
        }
        }
    }
    
    func fetchUserData() -> LoginDataBase?{
        var loginData: LoginDataBase?
        let realm = try! Realm()
        let result = realm.objects(LoginDataBase.self)
        loginData = result.first
        return loginData
    }
    
    
    
}
