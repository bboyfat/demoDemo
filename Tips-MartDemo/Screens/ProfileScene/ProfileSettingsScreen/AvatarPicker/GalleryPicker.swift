//
//  PickerAlert.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class GalleryPicker{
    
    let imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        return picker
    }()
    
    func presentPickerController(sourceType: UIImagePickerController.SourceType, controller: UIViewController){
        
        imagePicker.sourceType = sourceType
        controller.present(imagePicker, animated: true, completion: nil)
    }
    
    func addPicker(controller: UIViewController){
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let galleryAction = UIAlertAction(title: "Галерея", style: .default) { (action) in
            self.presentPickerController(sourceType: .photoLibrary, controller: controller)
        }
        let cameraAction = UIAlertAction(title: "Камера", style: .default) { (action) in
            self.presentPickerController(sourceType: .camera, controller: controller)
            
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        ac.addAction(galleryAction)
        ac.addAction(cameraAction)
        ac.addAction(cancelAction)
        
        controller.present(ac, animated: true, completion: nil)
    }
}
