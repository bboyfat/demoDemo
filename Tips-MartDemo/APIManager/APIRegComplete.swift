//
//  APIRegComplete.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/10/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import CoreData


class APIRegComplete {
    
    let userDefaults = UserDefaults.standard
    
    
    func getAuthCode(model: RegistrationModelAPI, completion: @escaping (UsersOutput) -> Void) {
        
        let phoneNumber = model.phoneNumber
        let password = model.password
        let authCode = model.authCode
        let inviter = model.inviter
        
        let params = "phoneNumber=\(phoneNumber)&authCode=\(authCode)&password=\(password)&inviter=\(inviter)"
        request(params: params, completion: completion)
     }
    
    public func request(params: String, completion: @escaping (UsersOutput) -> Void){
        guard let url = URL(string: "https://client.tips-mart.com/auth/v1/registration") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
//            guard let resp = response else { return }
            
            
            do{
                let answer = try JSONDecoder().decode(UsersOutput.self, from: data)
                completion(answer)
                print(answer)
                self.userDefaults.set(answer.data?.name, forKey: "name")
                self.userDefaults.set(answer.data?.surname, forKey: "surname")
                self.userDefaults.set(answer.data?.userid, forKey: "userId")
                self.userDefaults.set(answer.data?.accessToken.value, forKey: "accessToken")
                self.userDefaults.set(answer.data?.refreshToken.value, forKey: "refreshToken")
                
            } catch {
                print("!!!!!!!!!!!!!!!!!!OOPS, we have an error",error)
            }
            }.resume()
        
    }
    
}
