//
//  RefreshBalance.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


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
                    print(answer)
    
                    completion(answer.data.notifications)

                    UserDefaults.standard.set(answer.data.balance.green, forKey: "greenBalance")
                    UserDefaults.standard.set(answer.data.balance.gray, forKey: "grayBalance")
                    
                    print("\(answer.data.notifications.count)!!!!!!!!!!!!!!!!")
                    
                } catch let refrErr{
                    print("problem with data", refrErr)
                }
            }
        }.resume()
        
        
        
    }
    
    
    
}
