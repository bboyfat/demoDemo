//
//  WebViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/16/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        laodUrl()
//
        
        webView.frame =  CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 150)
//        self.view.addSubview(webView)
        self.view.insertSubview(webView, at: 1)
        
    }
       
    @IBAction func endReading(_ sender: UIButton) {
        
        dismiss(animated: true) {
            UIScreen.main.brightness = 1.0
        }
    }
    
    func  laodUrl(){
        let stringUrl = "https://auth.tips-mart.com/google/login"
        guard  let url = URL(string: stringUrl) else {
            return
        }
        let urlReq = URLRequest(url: url)
        webView.load(urlReq)
    }
    
    
    
    
   
    

}
