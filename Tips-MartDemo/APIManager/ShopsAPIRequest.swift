//
//  ShopsAPIRequest.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift


class ShopsApiRequest{
    
    
    func formRequest(accesToken: String, completion: @escaping([ShopsModel]) -> Void){
       
        let stringUrl = "https://tips-mart.com/files/shops.json"
        let url = URL(string: stringUrl)
        guard let forcedURL = url else { return }
        var request = URLRequest(url: forcedURL)
        request.httpMethod = "GET"
        request.addValue(accesToken, forHTTPHeaderField: "value")
        
        
        getData(urlRequest: request, completion: completion)
    }
    
    
    func getData(urlRequest withParameters: URLRequest, completion: @escaping([ShopsModel]) -> Void){
        
        
        URLSession.shared.dataTask(with: withParameters) { (data, response, error) in
            if let error = error{
                print("Can' get the data cause of", error)
                
            }
            if let data = data {
                do{
                   
                    let answer = try JSONDecoder().decode([ShopsModel].self, from: data)
                   
                   
                    print(answer)
                    
                     completion(answer)
                    
                    if self.checkDataRealm(answer: answer){
                    self.saveRealmData(answer: answer)
                    }
                    } catch let APIerr {
                    
                    print("Can't decode shops data", APIerr)
                    
                }
            }
            
            
            
        }.resume()
    }
    func checkDataRealm(answer: [ShopsModel]) -> Bool{
       
        var shopsModelArray: [ShopsModels] = []
        do{
            let realm = try Realm()
            
            shopsModelArray = Array(realm.objects(ShopsModels.self))
            
            
        } catch {
            print("Can't FETCH!!")
        }
        if shopsModelArray.count != answer.count{
            return true
        } else {
            return false
        }
        
        
    }
    
    func saveRealmData(answer: [ShopsModel]){
        
        answer.forEach({ (shop) in
            let shopsRealmData = ShopsModels()
            shopsRealmData.setValue(shop.url, forKey: "url")
            shopsRealmData.setValue(shop.type, forKey: "type")
            shopsRealmData.setValue(shop.shopID, forKey: "shopID")
            shopsRealmData.setValue(shop.pathImage, forKey: "pathImage")
            shopsRealmData.setValue(shop.name, forKey: "name")
           
            shop.extendedData.categories.forEach({ (each) in
                shopsRealmData.setValue(each, forKey: "categories")
            })
            shopsRealmData.setValue(shop.extendedData.maxCashback.currency, forKey: "currency")
            shopsRealmData.setValue(shop.extendedData.maxCashback.value, forKey: "value")
            
            OperationQueue.main.addOperation {
                let realm = try! Realm()
                
                do{
                    try realm.write {
                        realm.add(shopsRealmData)
                    }
                } catch {
                    print("realm.write is not working")
                }
            }
            
            
            
        })
        
    }
   
        
    
    
}



