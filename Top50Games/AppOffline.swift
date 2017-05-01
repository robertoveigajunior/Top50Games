//
//  SaveOffline.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 30/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import CoreData
import UIKit

protocol AppOfflineManagerDelegate : class {
    func didFinishFetchedGameApp(sender : AppOfflineManager,
                                 fetchedGameApp : [Game]?,
                                 error: Bool)
}

class AppOfflineManager {
    weak var delegate : AppOfflineManagerDelegate?
    var fetchedGameApp = [Game]()
    
    class func deleteAllData() {
        let managed = DataController().managedObjectContext
        let gameAppFetch = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entityGameApp)
        
        do {
            let resultData = try managed.fetch(gameAppFetch) as! [GameApp]
            for object in resultData {
                managed.delete(object)
            }
        } catch {
            fatalError("'\(Constants.errorLoadData): \(error)")
        }
        
        do {
            try managed.save()
        } catch {
            
        }
    }
    
    func didFinishFetchedGameApp() {
        self.delegate?.didFinishFetchedGameApp(sender: self,
                                               fetchedGameApp: self.fetchedGameApp,
                                               error: false)
    }
    
    class func seedGame(game: Game) {
        
        let managed = DataController().managedObjectContext
        let entity = NSEntityDescription.insertNewObject(forEntityName: Constants.entityGameApp,
                                                         into: managed) as! GameApp
        
        entity.setValue(game.name, forKey: "name")
        entity.setValue(game.popularity, forKey: "popularity")
        entity.setValue(game.boxArt, forKey: "boxArt")
        entity.setValue(game.logo, forKey: "logo")
        entity.setValue(game.viewers, forKey: "viewers")
        entity.setValue(game.channels, forKey: "channels")
        
        do {
            try managed.save()
        } catch {
            fatalError("\(Constants.errorSaveData): \(error)")
        }
    }
    
    func fetchTopGames() {
        let managed = DataController().managedObjectContext
        let gameAppFetch = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entityGameApp)
        
        do {
            let resultData = try managed.fetch(gameAppFetch) as! [GameApp]
            for result in resultData {
                let game = Game()
                game.name = result.name
                game.boxArt = result.boxArt
                game.channels = NSInteger(result.channels)
                game.popularity = NSInteger(result.popularity)
                game.logo = result.logo
                game.viewers = NSInteger(result.viewers)
                self.fetchedGameApp.append(game)
            }
            didFinishFetchedGameApp()
        } catch {
            fatalError("'\(Constants.errorLoadData): \(error)")
        }
    }
}
