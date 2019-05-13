//
//  LogOutputViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift

class LogOutputViewModel{
    
    var name = ""
    var surname = ""
    var accountID = ""
    var birthDay = ""
    var gender = ""
    
    func saveData(){
        let loginOutputs = LoginOutputsRealm()
        
        loginOutputs.setValue(self.name, forKey: "name")
        loginOutputs.setValue(self.surname, forKey: "surname")
        loginOutputs.setValue(self.birthDay, forKey: "birthDay")
        loginOutputs.setValue(self.accountID, forKey: "accountID")
        loginOutputs.setValue(self.gender, forKey: "gender")
        let realm = try! Realm()
        do{
           try realm.write {
                realm.add(loginOutputs)
            }
        } catch let saveErr{
            print("can't save", saveErr)
        }
        
        
    }
    
    func fetchData() -> LoginOutputsRealm?{
        var loginOutputs: LoginOutputsRealm?
        
        let realm = try! Realm()
        let result = realm.objects(LoginOutputsRealm.self)
        
        loginOutputs = result.first
        return loginOutputs
    }
    
    
}

