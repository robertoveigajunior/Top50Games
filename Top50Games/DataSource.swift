//
//  DataSource.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 29/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import UIKit
import Alamofire

protocol WebserviceManagerDelegate : class {
    func didFinishRetrievingData(sender : WebServiceManager,
                                 topGames : [Game]?,
                                 error: Bool)
}

class WebServiceManager: NSObject {
    weak var delegate : WebserviceManagerDelegate?
    var topGames = [Game]()
    
    func didFinishRetrievingData() {
        self.delegate?.didFinishRetrievingData(sender: self,
                                               topGames: self.topGames,
                                               error: false)
    }
    
    func getTopGames()
    {
        let urlString = "\(Urls.baseURL)games/top?client_id=\(Urls.clientID)&limit=50"
        let URL = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        Alamofire.request(URL!).responseJSON{ (response) in
            if response.error == nil{
                if let JSON = response.result.value
                {
                    AppOfflineManager.deleteAllData()
                    let responseDictionary : NSDictionary = JSON as! NSDictionary
                    let gamesList : [NSDictionary] = responseDictionary["top"] as! [NSDictionary]
                    
                    for gameObject in gamesList
                    {
                        var game = Game()
                        game = game.populateGameWithObject(dataDictionary: gameObject)
                        AppOfflineManager.seedGame(game: game)
                        self.topGames.append(game)
                        
                    }
                    self.didFinishRetrievingData()
                }
            } else {
                self.didFinishRetrievingData()
            }
        }
    }
}
