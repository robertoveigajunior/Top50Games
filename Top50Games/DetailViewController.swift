//
//  DetailViewController.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 29/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbViewers: UILabel!
    @IBOutlet weak var lbChanels: UILabel!
    @IBOutlet weak var imgGame: UIImageView!
    
    var game : Game?
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFields()
    }
    
    func setFields() {
        imgGame.cornerRadius()
        lbName.text = game!.name
        lbViewers.text = String(describing: game!.viewers!)
        lbChanels.text = String(describing: game!.channels!)
        imgGame.kf.setImage(with: URL(string: (game!.boxArt!)),
                                    placeholder: nil,
                                    options: [.transition(.fade(1))],
                                    progressBlock: nil,
                                    completionHandler: { (image, error, cache, url) in
                                        if (image == nil) {
                                            self.imgGame.image = Constants.imageDefault
                                        }
        })
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
