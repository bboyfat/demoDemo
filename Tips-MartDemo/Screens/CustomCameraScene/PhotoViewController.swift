//
//  PhotoViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 7/2/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    @IBOutlet weak var blurVisualEffectView: UIVisualEffectView!
    
    @IBOutlet weak var captureImageView: UIImageView!
    @IBOutlet weak var captureView: UIView!
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    var cameraDelegate: CamerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func updateBlurViewHole() {
        let maskView = UIView(frame: blurVisualEffectView.bounds)
        maskView.clipsToBounds = true;
        maskView.backgroundColor = UIColor.clear
        
        
        let outerbezierPath = UIBezierPath.init(roundedRect: blurVisualEffectView.bounds, cornerRadius: 0)
        let position = CGRect(x: self.view.center.x - 110, y: self.view.center.y - 110, width: 220, height: 100)
//        let rect = CGRect(x: 100, y: 200, width: 220, height: 100)
        let innerCirclepath = UIBezierPath.init(roundedRect:position, cornerRadius: 0)
//        maskView.center = self.view.center
        outerbezierPath.append(innerCirclepath)
        outerbezierPath.usesEvenOddFillRule = true
        
        let fillLayer = CAShapeLayer()
        fillLayer.fillRule = CAShapeLayerFillRule.evenOdd
        fillLayer.fillColor = UIColor.green.cgColor // any opaque color would work
        fillLayer.path = outerbezierPath.cgPath
        maskView.layer.addSublayer(fillLayer)
        
        blurVisualEffectView.mask = maskView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video) else { print("Unnable to get Succes")
            return}
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            stillImageOutput = AVCapturePhotoOutput()
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
            }
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
        
        updateBlurViewHole()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateBlurViewHole()
    }
    func setupLivePreview() {
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspectFill
        videoPreviewLayer.connection?.videoOrientation = .portrait
        captureView.layer.addSublayer(videoPreviewLayer)
        
        
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.captureView.bounds
            }
        }
        //Step12
    }
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        let size = CGSize(width: 220, height: 110)
        let image = UIImage(data: imageData)!.crop(to: size)
        
        captureImageView.image = image
    }
//    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
//
//        let cgimage = image.cgImage!
//        let contextImage: UIImage = UIImage(cgImage: cgimage)
//        let contextSize: CGSize = contextImage.size
//        var posX: CGFloat = 0.0
//        var posY: CGFloat = 0.0
//        var cgwidth: CGFloat = CGFloat(width)
//        var cgheight: CGFloat = CGFloat(height)
//
//        // See what size is longer and create the center off of that
//        if contextSize.width > contextSize.height {
//            posX = ((contextSize.width - contextSize.height) / 2)
//            posY = 0
//            cgwidth = contextSize.height
//            cgheight = contextSize.height
//        } else {
//            posX = 0
//            posY = ((contextSize.height - contextSize.width) / 2)
//            cgwidth = contextSize.width
//            cgheight = contextSize.width
//        }
//
//        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
//
//        // Create bitmap image from context using the rect
//        let imageRef: CGImage = cgimage.cropping(to: rect)!
//
//        // Create a new image based on the imageRef and rotate back to the original orientation
//        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
//
//        return image
//    }
    
    
    @IBAction func photoBtnaction(_ sender: Any) {
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
//        let croppedCGImage = imageView.image?.cgImage?.cropping(to: cropArea)
//        let croppedImage = UIImage(cgImage: croppedCGImage!)
//        imageView.image = croppedImage
        stillImageOutput.capturePhoto(with: settings, delegate: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.captureSession.stopRunning()
    }
    @IBAction func doneBtn(_ sender: Any) {
        
        if let image = captureImageView.image{
            cameraDelegate?.setImage(image: image)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension UIImage {
    
    func crop(to:CGSize) -> UIImage {
        
        guard let cgimage = self.cgImage else { return self }
        
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        
        guard let newCgImage = contextImage.cgImage else { return self }
        
        let contextSize: CGSize = contextImage.size
        
        //Set to square
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        let cropAspect: CGFloat = to.width / to.height
        
        var cropWidth: CGFloat = to.width
        var cropHeight: CGFloat = to.height
        
        if to.width > to.height { //Landscape
            cropWidth = contextSize.width
            cropHeight = contextSize.width / cropAspect
            posY = (contextSize.height - cropHeight) / 2
        } else if to.width < to.height { //Portrait
            cropHeight = contextSize.height
            cropWidth = contextSize.height * cropAspect
            posX = (contextSize.width - cropWidth) / 2
        } else { //Square
            if contextSize.width >= contextSize.height { //Square on landscape (or square)
                cropHeight = contextSize.height
                cropWidth = contextSize.height * cropAspect
                posX = (contextSize.width - cropWidth) / 2
            }else{ //Square on portrait
                cropWidth = contextSize.width
                cropHeight = contextSize.width / cropAspect
                posY = (contextSize.height - cropHeight) / 2
            }
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cropWidth, height: cropHeight)
        
        // Create bitmap image from context using the rect
        guard let imageRef: CGImage = newCgImage.cropping(to: rect) else { return self}
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let cropped: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        UIGraphicsBeginImageContextWithOptions(to, false, self.scale)
        cropped.draw(in: CGRect(x: 0, y: 0, width: to.width, height: to.height))
        let resized = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resized ?? self
    }
}
