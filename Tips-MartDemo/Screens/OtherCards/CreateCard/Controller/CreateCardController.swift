//
//  CreateCardController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/14/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import AVFoundation

class CreateCardController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var btnBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickerHeight: NSLayoutConstraint!
    @IBOutlet weak var categorisBtnLbl: UIButton!
    @IBOutlet weak var idTextFiled: UITextField!
    @IBOutlet weak var categoriesPicker: UIPickerView!
    var categoriesDSD = CategoriesPicker()
    var reader: Reader?
    
    let btn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "barCode"), for: .normal)
        button.addTarget(self, action: #selector(startScan), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.imageView?.frame = button.bounds
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endEditing()
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
        categorisBtnLbl.addTarget(self, action: #selector(changeCategory), for: .touchUpInside)
        idTextFiled.rightView = btn
        idTextFiled.rightViewMode = .always
        btn.addTarget(self, action: #selector(startScan), for: .touchUpInside)
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
        dismiss(animated: true, completion: nil)
    }
    @objc func startScan(){
        self.reader = Reader(withViewController: self, view: self.view, codeOutputHandler: self.handleCode)
        if let reader = self.reader{
            reader.requestCaptureSessionStartRunning()
        }
    }
    
    func handleCode(code: String){
        self.idTextFiled.text = code
        reader?.previewLayer?.removeFromSuperlayer()
    }
    
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        self.reader?.readerDelegate(output, didOutput: metadataObjects, from: connection)
        
        guard let readebleObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject else { return }
        guard let stringValue = readebleObject.stringValue else { return }
        
        self.idTextFiled.text = stringValue
        
        reader?.previewLayer?.removeFromSuperlayer()
        
        
        
    }
}
