//
//  ShopsAPIRequest.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class ShopsApiRequest{
    
    
    func formRequest(accesToken: String, completion: @escaping([ShopsModel]) -> Void){
       
        let stringUrl = "https://tips-mart.com/files/shops.json"
        let url = URL(string: stringUrl)
        guard let forcedURL = url else { return }
        var request = URLRequest(url: forcedURL)
        request.httpMethod = "GET"
        request.addValue(accesToken, forHTTPHeaderField: "value")
        
        
        getData(urlRequest: request, completion: completion)
    }
    
    
    func getData(urlRequest withParameters: URLRequest, completion: @escaping([ShopsModel]) -> Void){
        
        
        URLSession.shared.dataTask(with: withParameters) { (data, response, error) in
            if let error = error{
                print("Can' get the data cause of", error)
                
            }
            if let data = data {
                do{
                    
                    let answer = try JSONDecoder().decode([ShopsModel].self, from: data)
                    
                    
                    var images: [UIImage?] = []
                    answer.forEach({ (imagePath) in
                        guard let image = self.getImage(imagePath: imagePath.pathImage) else { return }
                        images.append(image)
                        print(images.count)
                    })
                    print(answer)
                    completion(answer)
                } catch let APIerr {
                    
                    print("Can't decode shops data", APIerr)
                    
                }
            }
            
            
            
        }.resume()
    }
    func getImage(imagePath: String) -> UIImage? {
        
            let urlString = "https://tips-mart.com/images/shops/\(imagePath)/logotype.png"
            
            guard let url = URL(string: urlString) else { return nil }
            var request = URLRequest(url: url)
            //        request.addValue(accessToken!, forHTTPHeaderField: "value")
            request.httpMethod = "GET"
        var image: UIImage?
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data{
                    
                    image = UIImage(data: data)
                    
                } else {
                    print(error)
                }
                }.resume()
            return image
        }
        
    
    
}



