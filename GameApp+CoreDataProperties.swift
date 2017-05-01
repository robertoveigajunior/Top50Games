//
//  GameApp+CoreDataProperties.swift
//  
//
//  Created by Roberto Luiz Veiga Junior on 30/04/17.
//
//

import Foundation
import CoreData


extension GameApp {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameApp> {
        return NSFetchRequest<GameApp>(entityName: "GameApp")
    }

    @NSManaged public var boxArt: NSObject?
    @NSManaged public var channels: Int16
    @NSManaged public var logo: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var popularity: Int16
    @NSManaged public var viewers: Int16

}
