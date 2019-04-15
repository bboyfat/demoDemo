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
    
    let userDefaults = UserDefaults()
    
    
    func getAuthCode(model: RegistrationModelAPI, completion:  @escaping (RegModelGet) -> Void) {
        
        let phoneNumber = model.phoneNumber
        let password = model.password
        
        
        
        let params = "phoneNumber=\(phoneNumber)&password=\(password)"
        
        
        print(params)
        request(params: params, completion: completion)
        
        
    }
    
    
    
    public func request(params: String, completion: @escaping (RegModelGet) -> Void){
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
               completion(answer)
                self.userDefaults.set(answer.data?.name, forKey: "name")
                self.userDefaults.set(answer.data?.surname, forKey: "surname")
                self.userDefaults.set(answer.data?.userid, forKey: "userId")
                    self.userDefaults.set(answer.data?.balance.green, forKey: "greenBalance")
                        self.userDefaults.set(answer.data?.balance.gray, forKey: "grayBalance")
                
            } catch {
                print("!!!!!!!!!!!!!!!!!!OOPS, we have an error",error)
            }
            }.resume()
        
    }
}
