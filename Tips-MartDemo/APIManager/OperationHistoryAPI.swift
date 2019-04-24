//
//  OperationHistoryAPI.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/23/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


class OperationHistoryAPI{
    typealias returnedParametr =  (OperationHistoryModel) -> Void
    func getHistory(header: String, urlString: String, completion: @escaping returnedParametr){
        
        
        
        guard let url = URL(string: urlString) else { return}
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(header)", forHTTPHeaderField: "Authorization")
        
        historySession(request: urlRequest, completion: completion)
    }
    
    
    func historySession(request: URLRequest, completion: @escaping returnedParametr){
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Can't refresh the balance", error)
                
            }
            if let data = data{
                do{
                    let answer = try JSONDecoder().decode(OperationHistoryModel.self, from: data)
                    completion(answer)
                   
                    
                } catch let refrErr{
                    print("problem with data", refrErr)
                }
            }
            }.resume()
    
}
}
