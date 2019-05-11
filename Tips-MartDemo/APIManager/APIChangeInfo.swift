//
//  APIChangeInfo.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
//https://client.tips-mart.com/profile/v1/change-data

class APIChangeInfo{
    
    
    func getAuthCode(model: ProfileModel, accessToken: String, completion:  @escaping (RegModelGet) -> Void) {
        let params: NSMutableDictionary = NSMutableDictionary()
        params.setValue(model.name, forKey: "name")
        params.setValue(model.surname, forKey: "surname")
        params.setValue(model.gender, forKey: "gender")
        
        guard let date = model.birthday else { return }
        
        params.setValue(date, forKey: "birthday")
        
        
        
        let header = accessToken
        let jsonDatasonData = try? JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions())
        let optionsObject = NSString(data: jsonDatasonData!, encoding: String.Encoding.utf8.rawValue)! as String
        let postParamsString = "objChanges=\(optionsObject)"
        
        
        print(postParamsString)
        request(params: postParamsString, header: header, completion: completion)
        
        
    }
    
    
    
    public func request(params: String, header: String, completion: @escaping (RegModelGet) -> Void){
        guard let url = URL(string: "https://client.tips-mart.com/profile/v1/change-data") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.httpBody = params.data(using: String.Encoding.utf8)
        request.addValue("Bearer \(header)", forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let answer = try JSONDecoder().decode(RegModelGet.self, from: data)
                completion(answer)
                
                
            } catch {
                print("!!!!!!!!!!!!!!!!!!OOPS, we have an error",error)
            }
            }.resume()
        
    }
}
