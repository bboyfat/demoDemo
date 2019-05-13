//
//  AvatarBase.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation
import RealmSwift

class AvatarBase: Object{
    @objc dynamic var photo: Data?
}
