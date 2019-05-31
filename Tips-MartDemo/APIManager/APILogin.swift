//
//  APILogin.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/10/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift

class APILogin{
    
    let userDefaults = UserDefaults.standard
    let loginOutputs = LogOutputViewModel()
    
    
    func getAuthCode(completion:  @escaping (UsersOutput) -> Void) {
        
        let userData = LoginViewModel().fetchUserData()
        
        guard let phoneNumber = userData?.phoneNumber else { return}
        guard let password = userData?.password else {return}
        
        let params = "phoneNumber=\(phoneNumber)&password=\(password)"
        
        request(params: params, completion: completion)
        
        
    }
    
    
    
    public func request(params: String, completion: @escaping (UsersOutput) -> Void){
        guard let url = URL(string: URLS.login.rawValue) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            do{
                
                let answer = try JSONDecoder().decode(UsersOutput.self, from: data)
                completion(answer)
                
            } catch {
                print("!!!!!!!!!!!!!!!!!!OOPS, we have an error",error)
            }
            }.resume()
        
    }
    
    
}
