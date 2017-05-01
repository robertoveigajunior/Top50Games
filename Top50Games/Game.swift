//
//  Game.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 29/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import UIKit

class Game: NSObject {
    
    var name : String?
    var popularity : NSInteger?
    var boxArt : String?
    var logo: String?
    var viewers : NSInteger?
    var channels : NSInteger?
    
    func populateGameWithObject(dataDictionary: NSDictionary) -> Game
    {
        let gameDictionary : NSDictionary = dataDictionary["game"] as! NSDictionary
        self.name = gameDictionary["name"] as? String
        self.popularity = gameDictionary["popularity"] as? NSInteger
        self.viewers = dataDictionary["viewers"] as? NSInteger
        self.channels = dataDictionary["channels"] as? NSInteger
        let gameImage = Image()
        self.boxArt = gameImage.populateImageObjectWithData(ImageDictionary: gameDictionary["box"] as! NSDictionary).large
        let logoImage = Image()
        self.logo = logoImage.populateImageObjectWithData(ImageDictionary: gameDictionary["logo"] as! NSDictionary).large
        
        return self
    }
    
}
