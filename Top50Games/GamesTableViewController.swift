//
//  GamesTableViewController.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 29/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import UIKit

class GamesTableViewController: UITableViewController {
    
    var games = [Game]()
    var selectedGame = Game()
    
    let cellIdentifier = "CellGame"
    let sgDetail = "sgDetail"
    var refreshBarButtom = UIBarButtonItem()

    @IBOutlet weak var lbTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTopGamesOffline()
        setRefreshControl()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! GameTableViewCell
        let game = self.games[indexPath.row]
        cell.drawGameCellWithDetails(title: game.name!, viewers: game.viewers!, image: game.boxArt!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedGame = self.games[indexPath.row]
        performSegue(withIdentifier: sgDetail, sender: self)
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        refreshBarButtom = navigationItem.rightBarButtonItem!
        let ai = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        ai.startAnimating()
        ai.activityIndicatorViewStyle = .white
        let buttom = UIBarButtonItem(customView: ai)
        navigationItem.rightBarButtonItem = buttom
        self.getTopGames()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == sgDetail
        {
            let detailVC = segue.destination as! DetailViewController
            detailVC.game = selectedGame
        }
    }
}

//MARK: - RefreshControl
extension GamesTableViewController {
    func setRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        refreshControl!.attributedTitle = NSAttributedString()
        refreshControl!.tintColor = UIColor.primary
    }
}

//MARK: - Delegates
extension GamesTableViewController: WebserviceManagerDelegate {
    func didFinishRetrievingData(sender: WebServiceManager, topGames: [Game]?, error: Bool) {
        guard error == false else {
            self.showAlert()
            return
        }
        let result = topGames!.sorted{$0.popularity! > $1.popularity!}
        if result.count > 0 {
            self.games = result
            lbTitle.text = "#  Top 50 Games  #"
            tableView.reloadData()
        } else {
            lbTitle.text = "#  Top 50 Games  # - Modo offline"
        }
        navigationItem.rightBarButtonItem = refreshBarButtom
        refreshControl!.endRefreshing()
    }
}

extension GamesTableViewController: AppOfflineManagerDelegate {
    func didFinishFetchedGameApp(sender: AppOfflineManager, fetchedGameApp: [Game]?, error: Bool) {
        guard error == false else {
            self.showAlert()
            return
        }
        self.games = fetchedGameApp!.sorted{$0.popularity! > $1.popularity!}
        if self.games.count == 0 {
            getTopGames()
        }
        tableView.reloadData()
    }
}

//MARK: - Common methods
extension GamesTableViewController {
    func getTopGames()
    {
        let manager = WebServiceManager()
        manager.delegate = self
        manager.getTopGames()
    }
    
    func getTopGamesOffline()
    {
        let manager = AppOfflineManager()
        manager.delegate = self
        manager.fetchTopGames()
    }
    
    func showAlert()
    {
        UIAlertController().showAlert(context:self, title: "Ops!", message: Constants.msgLoadGames)
    }
}
