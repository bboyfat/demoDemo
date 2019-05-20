//
//  ProfileSetController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class ProfileSetController: UIViewController{
    
    
    
    @IBOutlet var settingsView: ProfileSettingsView!
    
    
    let avatarSettings: AvatarViewModel = AvatarViewModel()
    let pickerSettings = GalleryPicker()
    
    //MARK: User Data model
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         getInfo()
         moveUp()
    }
    func getInfo(){
        if let userDataBase = LogOutputViewModel().fetchData(){
            settingsView.birthDayTextField.text = userDataBase.birthDay
            settingsView.nameTextField.text = userDataBase.name
            settingsView.surnameTextField.text = userDataBase.surname
        }
        
    }
    
    func moveUp(){
        self.settingsView.birthDayTextField.didCreated()
        self.settingsView.nameTextField.didCreated()
        self.settingsView.surnameTextField.didCreated()
        
    }
    
    
    // setup Picker
    
    func setPicker(){
        pickerSettings.imagePicker.delegate = self
        pickerSettings.addPicker(controller: self)
    }
    @IBAction func changePhoto(_ sender: UIButton) {
        setPicker()
    }
    
    @IBAction func closeVc(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            
        }
    }
    
    @IBAction func saveInfoBtn(_ sender: UIBarButtonItem) {
        //        let imageData = UIImage.jpegData(self.settingsView.avatarView.image!)
        let imgData = self.settingsView.avatarView.image!.jpegData(compressionQuality: 100)
        if avatarSettings.fetchImage() == nil{
            self.avatarSettings.image = imgData
            self.avatarSettings.saveImage()
        } else {
            if let data = imgData{
                self.avatarSettings.updateImage(dataImage: data)
            } else {
                return
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
}

extension ProfileSetController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editingImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            self.settingsView.avatarView.image = editingImage
            let imgData = editingImage.jpegData(compressionQuality: 100)
            self.avatarSettings.image = imgData
            self.avatarSettings.saveImage()
            
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            self.settingsView.avatarView.image = originalImage
            
        }
        picker.dismiss(animated: true) {
            
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
