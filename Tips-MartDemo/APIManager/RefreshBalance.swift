//
//  RefreshBalance.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift

class RefreshToken{
    
    
    
    func getBalance(header: String, completion: @escaping ([NotificationModel]) -> Void){
        
        
        let urlString = "https://client.tips-mart.com/home/v1/load-page"
        guard let url = URL(string: urlString) else { return}
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(header)", forHTTPHeaderField: "Authorization")
        
        requestForBalance(request: urlRequest, completion: completion)
    }
    
    
    func requestForBalance(request: URLRequest, completion: @escaping ([NotificationModel]) -> Void){
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Can't refresh the balance", error)
                
            }
            if let data = data{
                do{
                    let answer = try JSONDecoder().decode(RefreshBalance.self, from: data)
                    
                    completion(answer.data.notifications)
                    
                    
                    if self.checkDataRealm(answer: answer.data.notifications){
                        self.saveData(answer: answer.data.notifications)
                    }
                    UserDefaults.standard.set(answer.data.balance.green, forKey: "greenBalance")
                    UserDefaults.standard.set(answer.data.balance.gray, forKey: "grayBalance")
                    
                    
                    
                } catch let refrErr{
                    print("problem with data", refrErr)
                }
            }
            }.resume()
        
        
        
    }
    
    func saveData(answer: [NotificationModel]){
        
        
        answer.forEach({ (notification) in
            let notifRealmData = NotificationModelRealm()
            notifRealmData.setValue(notification.created, forKey: "created")
            notifRealmData.setValue(notification.isReaded, forKey: "isReaded")
            notifRealmData.setValue(notification.kind, forKey: "kind")
            notifRealmData.setValue(notification.notificationID, forKey: "notificationID")
            notifRealmData.setValue(notification.text, forKey: "text")
            
            OperationQueue.main.addOperation {
                let realm = try! Realm()
                
                do{
                    try realm.write {
                        realm.add(notifRealmData)
                    }
                } catch {
                    print("realm.write is not working")
                }
            }
            
            
            
        })
        
    }
    func checkDataRealm(answer: [NotificationModel]) -> Bool{
        
        var shopsModelArray: [NotificationModelRealm] = []
        do{
            let realm = try Realm()
            
            shopsModelArray = Array(realm.objects(NotificationModelRealm.self))
            
            
        } catch {
            print("Can't FETCH!!")
        }
        if shopsModelArray.count != answer.count || shopsModelArray.count == 0{
            return true
        } else {
            return false
        }
        
        
        
        
    }
    
    
    
}
