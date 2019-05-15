//
//  DroppablePin.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 5/15/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import MapKit

class DroppablePin: NSObject, MKAnnotation{
    dynamic var coordinate: CLLocationCoordinate2D
    var identifier: String
    
    
    init(coordinate: CLLocationCoordinate2D, identifier: String) {
        self.coordinate = coordinate
        self.identifier = identifier
        super.init()
    }
    
}
