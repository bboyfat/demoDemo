//
//  InfoAlert.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/22/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class infoAlert{
    
    func presentAlert(view: UIViewController, title: String){
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        ac.addAction(action)
        view.present(ac, animated: true, completion: nil)
        
        
    }
    
}
