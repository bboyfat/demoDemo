//
//  GetReferalsIncome.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


class GetReferalsInfo{
    
    func getInf(header: String, urlString: String){
        
        
       
        guard let url = URL(string: urlString) else { return}
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("Bearer \(header)", forHTTPHeaderField: "Authorization")
        
        getInformation(request: urlRequest)
    }
    
    
    func getInformation(request: URLRequest){
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Can't refresh the balance", error)
                
            }
            if let data = data{
                do{
                    let answer = try JSONDecoder().decode(GetInfoModel.self, from: data)
                    print(answer)
                   UserDefaults.standard.set(answer.data.totalCashback, forKey: "totalCasback")
                    UserDefaults.standard.set(answer.data.referralsIncome, forKey: "referralsIncome")
                    
                    
                } catch let refrErr{
                    print("problem with data", refrErr)
                }
            }
            }.resume()
        
        
        
    }
    
    
}
