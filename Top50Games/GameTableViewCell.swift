//
//  GameTableViewCell.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 29/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import UIKit
import Kingfisher

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgGame: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbViewers: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func drawGameCellWithDetails(title: String, viewers: NSInteger, image: String)
    {
        if title != "" {
            self.lbName.text = title
        }
        if viewers > 0 {
            self.lbViewers.text = "👁‍🗨 \(viewers)"
        }
        
        self.imgGame.cornerRadiusSmall()
        guard image != "" else {
            self.imgGame.image = Constants.imageDefault
            return
        }
        self.imgGame.kf.setImage(with: URL(string: image),
                                 placeholder: nil,
                                 options: [.transition(.fade(1))],
                                 progressBlock: nil,
                                 completionHandler: { (image, error, cache, url) in
                                    if (image == nil) {
                                        self.imgGame.image = Constants.imageDefault
                                    }
        })
    }
}
