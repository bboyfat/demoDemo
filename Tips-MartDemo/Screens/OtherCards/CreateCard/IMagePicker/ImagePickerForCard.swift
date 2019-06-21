//
//  ImagePickerForCard.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/18/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit



class GalleryPickImagePickerForCard: UIImagePickerController{
    
    let imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        return picker
    }()
    
    func presentPickerController(sourceType: UIImagePickerController.SourceType, controller: UIViewController){
        imagePicker.sourceType = sourceType
        controller.present(imagePicker, animated: true, completion: nil)
    }
    
   
}
