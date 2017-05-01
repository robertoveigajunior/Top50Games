//
//  Custom.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 29/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import UIKit

//MARK: - CustomNavigation
class CustomNavigation: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let primaryColor = UIColor.primary
        let itemColor = UIColor.common
        
        var dict = Dictionary<String, UIColor>()
        dict.updateValue(itemColor, forKey: NSForegroundColorAttributeName)
        dict.updateValue(itemColor, forKey: NSBackgroundColorAttributeName)
        self.navigationBar.titleTextAttributes = dict
        
        self.navigationBar.barTintColor = primaryColor
        self.navigationBar.tintColor = itemColor
        self.navigationBar.isTranslucent = false
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
