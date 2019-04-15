//
//  ProfileModel.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


struct Changes: Codable{
    var objChanges: ProfileModel?
}


struct ProfileModel: Codable{
    var name: String?
    var surname: String?
    var birthday: Double?
    var gender: String?
}
