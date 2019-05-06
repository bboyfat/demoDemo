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
        UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
        UserDefaults.standard.set(password, forKey: "password")
        
        
        let params = "phoneNumber=\(phoneNumber)&password=\(password)"
        
        print(phoneNumber)
        print(params)
        request(params: params, completion: completion)
        
        
    }
    
    
    
    public func request(params: String, completion: @escaping (RegModelGet) -> Void){
        guard let url = URL(string: URLS.login.rawValue) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
          
            
           
            do{
                let answer = try JSONDecoder().decode(RegModelGet.self, from: data)
               completion(answer)
                self.userDefaults.set(answer.data?.name, forKey: "name")
                self.userDefaults.set(answer.data?.surname, forKey: "surname")
                self.userDefaults.set(answer.data?.userid, forKey: "userId")
                self.userDefaults.set(answer.data?.accessToken.value, forKey: "accessToken")
                self.userDefaults.set(answer.data?.refreshToken.value, forKey: "refreshToken")
                    self.userDefaults.set(answer.data?.balance.green, forKey: "greenBalance")
                        self.userDefaults.set(answer.data?.balance.gray, forKey: "grayBalance")
                
            } catch {
                print("!!!!!!!!!!!!!!!!!!OOPS, we have an error",error)
            }
            }.resume()
        
    }
}
