//
//  APIPost.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/9/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
protocol APIDelegate{
    func getAuthCode(model: RegistrationModelAPI, completion: @escaping (AuthModel) -> Void)
    
}

class APIManager {
    
    
    
    

   
    func getAuthCode(model: RegistrationModelAPI, completion: @escaping (AuthModel) -> Void){
        let params: NSMutableDictionary = NSMutableDictionary()
        params.setValue(model.phoneNumber, forKey: "phoneNumber")
        params.setValue(model.inviter, forKey: "inviter")
        
        let jsonDatasonData = try? JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions())
        let optionsObject = NSString(data: jsonDatasonData!, encoding: String.Encoding.utf8.rawValue)! as String
        let postParamsString = "options=\(optionsObject)"
        
        request(params: postParamsString, completion: completion)
        
        
        
    }
    
    public func request(params: String, completion: @escaping (AuthModel) -> Void){
        guard let url = URL(string: "https://tips-mart.com/api/auth/get-auth-code") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = params.data(using: String.Encoding.utf8)
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            do{
                let answer = try JSONDecoder().decode(AuthModel.self, from: data)
                
                completion(answer)
                print(String(data: data, encoding: String.Encoding.utf8))
                
            } catch {
                
            }
        }.resume()
        
    }
    
    
    
}










