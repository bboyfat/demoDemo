//
//  MapAPI.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class MapAPI{
   
    
   
    
    var coordinates: [ShopsCoordinates] = []
    
    
    var imageUrlArray: [String] = []
    var imageArray: [UIImage] = []
    
    
    func getLocation( handler: @escaping (_ status: Bool) -> ()){
//        coordinates = []
        
        Alamofire.request(shopsLocationUrl).responseJSON { (dataResponse) in
            guard let data = dataResponse.data else { return }
            
            do{
                let json = try JSONDecoder().decode([ShopsCoordinates].self, from: data)
                self.coordinates = json
                self.coordinates.forEach({ (coordinate) in
                    coordinate.locations.forEach({ (location) in
                        self.imageUrlArray.append(location.pathImage)
                    })
                })
                handler(true)
            } catch {
                print ("can't get the Coordinates")
                handler(false)
            }
            
            
        }
    }
    
    func getImages(handler: @escaping (_ status: Bool) -> ()){
        imageUrlArray.forEach { (url) in
            Alamofire.request(url).responseImage(completionHandler: { (imageData) in
                guard let image = imageData.result.value else {return}
                self.imageArray.append(image)
                handler(true)
            })
        }
        
    }
    
    
}
