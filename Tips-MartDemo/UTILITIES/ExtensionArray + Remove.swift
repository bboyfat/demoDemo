//
//  ExtensionArray + Remove.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/10/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation


extension Array where Element: Equatable{
    mutating func remove(_ element: Element) {
        _ = firstIndex(of: element).flatMap {
            self.remove(at: $0)
        }
    }
}
