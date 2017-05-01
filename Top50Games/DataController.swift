//
//  DataController.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 30/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import UIKit
import CoreData
class DataController: NSObject {
    
    var managedObjectContext: NSManagedObjectContext
    
    override  init() {
        guard let modelURL = Bundle.main.url(forResource: Keys.DBName, withExtension:"momd") else {
            fatalError(Constants.errorLoadData)
        }

        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("\(Constants.errorLoadDB): \(modelURL)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        self.managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]

        let storeURL = docURL.appendingPathComponent("\(Keys.DBName).sqlite")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("\(Constants.errorMigrating): \(error)")
        }
        
    }
}
