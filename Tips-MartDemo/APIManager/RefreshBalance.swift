//
//  RefreshBalance.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class RefreshToken{
    
    
    
    func getBalance(header: String){
     

        let urlString = "https://client.tips-mart.com/home/v1/load-page"
        guard let url = URL(string: urlString) else { return}
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(header)", forHTTPHeaderField: "Authorization")
        
        requestForBalance(request: urlRequest)
    }
    
    
    func requestForBalance(request: URLRequest){
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Can't refresh the balance", error)
                
            }
            if let data = data{
                do{
                 let answer = try JSONDecoder().decode(RefreshBalance.self, from: data)
                    print(answer)
                    UserDefaults.standard.set(answer.data.balance.green, forKey: "greenBalance")
                    UserDefaults.standard.set(answer.data.balance.gray, forKey: "grayBalance")
                    
                } catch let refrErr{
                    print("problem with data", refrErr)
                }
            }
        }.resume()
        
        
        
    }
    
    
    
}
