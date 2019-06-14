//
//  ModelDecorator.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 6/13/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import Foundation



class ModelDecorator{
    
    
    func mySorting<T>(_ array: [T]) -> [[T]]{
        var newArray: [[T]] = []
        array.forEach { (item) in
            if let lastSubArray: [T] = newArray.last, lastSubArray.count == 3{
                newArray.append([item])
            } else if newArray.isEmpty {
                newArray.append([item])
            }
            else {
                var lastSubArray: [T] = newArray.removeLast()
                lastSubArray.append(item)
                newArray.append(lastSubArray)
            }
        }
        return newArray
    }
    
    
    
}
