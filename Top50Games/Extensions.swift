//
//  Extensions.swift
//  Top50Games
//
//  Created by Roberto Luiz Veiga Junior on 29/04/17.
//  Copyright © 2017 Games. All rights reserved.
//

import UIKit

extension UIColor {
    public class var primary: UIColor
    {
        return UIColor(red: CGFloat(75)/255.0, green: CGFloat(54)/255.0, blue: CGFloat(124)/255.0, alpha: 1.0)
    }
    public class var secondary: UIColor
    {
        return UIColor(red: CGFloat(100)/255.0, green: CGFloat(65)/255.0, blue: CGFloat(164)/255.0, alpha: 1.0)
    }
    public class var common: UIColor
    {
        return UIColor(red: CGFloat(249)/255.0, green: CGFloat(248)/255.0, blue: CGFloat(252)/255.0, alpha: 1.0)
    }
}

extension UIAlertController {
    func showAlert(context: UITableViewController , title: String!, message: String!)
    {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "Ok", style: .destructive, handler: nil)
        alert.addAction(okAction)
        context.present(alert, animated: true, completion: nil)
    }
}
extension UIImageView {
    func cornerRadius() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    func cornerRadiusSmall() {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = true
    }
}
