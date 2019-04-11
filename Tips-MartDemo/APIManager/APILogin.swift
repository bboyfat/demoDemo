//
//  APILogin.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/10/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import CoreData

class APILogin{
    
    
    func getAuthCode(model: RegistrationModelAPI) {
        
        let phoneNumber = model.phoneNumber
        let password = model.password
        
        
        
        let params = "phoneNumber=\(phoneNumber)&password=\(password)"
        
        
        print(params)
        request(params: params)
        
        
    }
    
    
    
    public func request(params: String){
        guard let url = URL(string: "https://client.tips-mart.com/auth/v1/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            guard let resp = response else { return }
            print(resp)
            print(String(data: data, encoding: String.Encoding.utf8))
            do{
                let answer = try JSONDecoder().decode(RegModelGet.self, from: data)
//                let context = CoreDataManager.shared.persistentContainer.viewContext
//                let userInfo = NSEntityDescription.insertNewObject(forEntityName: "UserParams", into: context)
//                userInfo.setValue(answer.userid, forKey: "userId")
//                userInfo.setValue(answer.refreshToken, forKey: "refreshToken")
//                userInfo.setValue(answer.accessToken, forKey: "accessToken")
//                //                userInfo.setValue(<#T##value: Any?##Any?#>, forKey: "expiresRefresh")
//                //                userInfo.setValue(<#T##value: Any?##Any?#>, forKey: "expiresAcces")
//                do{
//                    try context.save()
//                } catch let saveErr {
//                    print("Can't save values", saveErr)
//                }
                
                
            } catch {
                print("!!!!!!!!!!!!!!!!!!OOPS, we have an error",error)
            }
            }.resume()
        
    }
}
