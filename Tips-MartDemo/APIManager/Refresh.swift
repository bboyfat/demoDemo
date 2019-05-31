//
//  Refresh.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/19/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


class Refresh{
    private let token = UserDefaults.standard.string(forKey: "refreshToken")
    func refreshToken(){
        let urlString = "https://client.tips-mart.com/auth/v1/refresh-token"
        guard let url = URL(string: urlString) else { return}
        var urlRequest = URLRequest(url: url)
        guard let token = token else { return }
        
        urlRequest.httpMethod = "POST"
        let params = "token=\(token)"
        urlRequest.httpBody = params.data(using: String.Encoding.utf8)
    
        getToken(request: urlRequest)
    }
    
    
    func getToken(request: URLRequest){
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print("Can;t refresh token", error)
            }
            if let data = data{
                do{
                    
                let answer = try JSONDecoder().decode(RefreshModel.self, from: data)
                    UserDefaults.standard.set(answer.data.accessToken.value, forKey: "accessToken")
                     UserDefaults.standard.set(answer.data.accessToken.expires, forKey: "accessTokenExpires")
                    UserDefaults.standard.set(answer.data.refreshToken.value, forKey: "refreshToken")
                    UserDefaults.standard.set(answer.data.refreshToken.expires, forKey: "refreshTokenExpires")
                    
               
                } catch let tokenErr{
                    print("Problem with data", tokenErr)
                }
            }
        }.resume()
    }
    
    
}
