//
//  IntroduceInput.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/12/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation

class IntroduceInput: InputModel, Codable{
    
    var objChanges = [IntroduceData()]
    
    
}


class IntroduceData: Codable{
    
    var name = ""
    var surname = ""
    var birthday = ""
    var gender = ""
}
