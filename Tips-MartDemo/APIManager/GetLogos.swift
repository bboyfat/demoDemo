//
//  GetLogos.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/17/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit


class GetLogos{
    
    func urlPath(imagePath: String, completion: @escaping (UIImage?) -> Void) {
       
       
        let urlString = "https://tips-mart.com/images/shops/\(imagePath)/logotype.png"
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.cachePolicy = .useProtocolCachePolicy
       
        getImage(request: request, completion: completion)
        
    }
    
    func getImage(request: URLRequest, completion: @escaping (UIImage?) -> Void){
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print("cant get an image", error)
            }
            if let data = data{
                
                guard let image = UIImage(data: data) else {return}
                OperationQueue.main.addOperation {
                    completion(image)
                }
                
            } else {
                OperationQueue.main.addOperation {
                    completion(nil)
                }
            }
            
            
            }.resume()
    }
    
}
