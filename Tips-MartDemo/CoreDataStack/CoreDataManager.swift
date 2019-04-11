//
//  CoreDataManager.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/10/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import CoreData


class CoreDataManager{
    
    static let shared = CoreDataManager()
    
    let persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tips_MartDemo")
        
        container.loadPersistentStores { (storeDescriprion, error) in
            if let error = error{
                fatalError("Loading of store failed \(error)")
            }
            
        }
        
        return container
    }()
    
    
    
    
}
