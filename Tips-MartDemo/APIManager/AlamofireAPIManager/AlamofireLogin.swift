//
//  AlamofireAPIManager.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/11/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import Alamofire



class AlamofireLogin{
    
    let userDefaults = UserDefaults.standard
    var loginOutputs = LogOutputViewModel()
    
    func postRequest(model: LoginViewModel, url: String, handler: @escaping(_ status: Bool) ->()){
            let data = try! JSONEncoder().encode(model)
            let params = try! JSONSerialization.jsonObject(with: data, options: []) as! Parameters
        
        Alamofire.request(url, method: .post, parameters: params).response { (dataResponse) in
            do{
            let json = try JSONDecoder().decode(UsersOutput.self, from: dataResponse.data!)
                if json.success == true{
                    self.userDefaults.set(json.data?.accessToken.value, forKey: "accessToken")
                    self.userDefaults.set(json.data?.refreshToken.value, forKey: "refreshToken")
                    self.loginOutputs.name = json.data?.name ?? ""
                    self.loginOutputs.surname = json.data?.surname ?? ""
                    self.loginOutputs.gender = "male"
                    self.loginOutputs.birthDay = "09.09.1993"
                    guard let id = json.data?.userid else { return }
                    self.loginOutputs.accountID = String(id)
                    if let id = json.data?.userid{
                        self.loginOutputs.accountID = String(id)
                    }
                    self.loginOutputs.saveData()
                    handler(true)
                } else {
                    handler(false)
                }
            } catch let logErr {
                print("AlamofireAPIManager postRequest", logErr)
            }
        }
       
    }
    
   
    
}
