//
//  CreateCardController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/14/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import AVFoundation

protocol CamerDelegate{
    func setImage(image: UIImage)
}

class CreateCardController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, CamerDelegate {
    
    @IBOutlet weak var btnBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickerHeight: NSLayoutConstraint!
    @IBOutlet weak var categorisBtnLbl: UIButton!
    @IBOutlet weak var idTextFiled: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cardNameTextField: UITextField!
    @IBOutlet weak var categoriesPicker: UIPickerView!
     var cardsDataBase = OtherCardsModel()
    
    var categoriesDSD = CategoriesPicker()
    
    var imagePicker: GalleryPickImagePickerForCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categorisBtnLbl.addTarget(self, action: #selector(changeCategory), for: .touchUpInside)
        endEditing()
        imagePicker = GalleryPickImagePickerForCard()
        imagePicker?.imagePicker.delegate = self
        categoriesPicker.dataSource = categoriesDSD
        categoriesPicker.delegate = categoriesDSD
        categoriesDSD.returnTitle = {[weak self] in
            self?.categorisBtnLbl.setTitle($0, for: .normal)
            self?.pickerHeight.constant = 0
            self?.btnBottomConstraint.constant = 80
            UIView.animate(withDuration: 0.3) {
                self?.view.layoutIfNeeded()
                
            }
        }
        
    }
    
    func endEditing(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleEndEditing))
        self.view.addGestureRecognizer(tap)
    }
    @objc func handleEndEditing(){
        self.view.endEditing(true)
    }
    @objc func changeCategory(){
        view.layoutIfNeeded()
        self.btnBottomConstraint.constant = 0
        self.pickerHeight.constant = 300
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    @IBAction func dismissBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createNewCard(_ sender: UIButton) {
        if let cardName = cardNameTextField.text,
            let id = idTextFiled.text, let category = categorisBtnLbl.titleLabel?.text, let image = imageView.image{
            cardsDataBase.cardName = cardName
            cardsDataBase.cardId = id
            cardsDataBase.category = category
            cardsDataBase.logoImage = image
            cardsDataBase.saveData()
        } else {
            return
            print("OOOOOPSSPSPSPPSPS")
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewCartAdded"), object: self)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func scanBtnAction(_ sender: Any) {
        let vc = BarCodeController()
        vc.endScaning = {[weak self] in
            self?.idTextFiled.text = $0
        }
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func addLogoAction(_ sender: UIButton) {
        setPicker(sourceType: .photoLibrary)
    }
    
    @IBAction func madePhotoAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "CustomCameraScene", bundle: nil).instantiateViewController(withIdentifier: "CustomCameraVC") as! PhotoViewController
        vc.cameraDelegate = self
        self.present(vc, animated: true, completion: nil)
        
//        setPicker(sourceType: .camera)
    }
    func setImage(image: UIImage){
        self.imageView.image = image
    }
    
    func setPicker(sourceType: UIImagePickerController.SourceType){
        imagePicker?.presentPickerController(sourceType: sourceType, controller: self)
    }
    
}

extension CreateCardController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editingImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
          imageView.image = editingImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
           imageView.image = originalImage
        }
        picker.dismiss(animated: true) {
            
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
