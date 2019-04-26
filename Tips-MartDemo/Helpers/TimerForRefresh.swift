//
//  Timer.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/26/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit

class TimerForRefresh{
    
    var refreshTimer: Timer!
    
    let accessToken = UserDefaults.standard.string(forKey: "accessToken")
    
    func refreshInfo(){
       
        refreshTimer = Timer.scheduledTimer(timeInterval: 1500, target: self, selector: #selector(handleRefresh), userInfo: nil, repeats: true)
    
        
    }
    
    @objc func handleRefresh(){
        if let accessToken = accessToken{
            RefreshToken().getBalance(header: accessToken) { (notif) in
                
            }
        }
        
    }
    

    
}
