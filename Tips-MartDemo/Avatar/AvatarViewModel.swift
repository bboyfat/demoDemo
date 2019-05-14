//
//  AvatarViewModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import RealmSwift

class AvatarViewModel{
    
    var image: Data?
    
    func saveImage(){
        let imageData = AvatarBase()
        let realm = try! Realm()
        
        imageData.setValue(self.image, forKey: "photo")
        
        do{
          try realm.write {
                realm.add(imageData)
            }
        } catch {
            print("can't save photo")
        }
        
    }
    func fetchImage() -> UIImage?{
        let realm = try! Realm()
        
        var image: UIImage?
        
        let result = realm.objects(AvatarBase.self)
        let imageData = result.last
        if let data = imageData?.photo{
           image = UIImage(data: data, scale: 80)!
        } else {
            image = #imageLiteral(resourceName: "man")
        }
        print(result.count)
        return image
    }
    
    func updateImage(dataImage: Data){
        let realm = try! Realm()
        
       let result = realm.objects(AvatarBase.self)
        let data = result.last
        if dataImage != data?.photo{
            saveImage()
        }
    }
    
    
}
