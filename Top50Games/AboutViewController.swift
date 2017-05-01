//
//  AboutViewController.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 29/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgLogo.cornerRadiusSmall()
    }
}
