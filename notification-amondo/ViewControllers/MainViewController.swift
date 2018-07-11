//
//  MainViewController.swift
//  notification-amondo
//
//  Created by Val on 7/11/18.
//  Copyright © 2018 frolapps. All rights reserved.
//

import UIKit

class MainViewController: ViewController {
    
    @IBOutlet weak var notificationAboveButton: UIButton!
    @IBOutlet weak var notificationBelowButton: UIButton!
    
    @IBAction func showNotificationAbove() {
        let color = UIColor(hex: "C71F4E")
        
        showNotificationRelatedToView(notificationAboveButton, isAbove: true, padding: 20, emoji: "🤷", backgroundColor: color, text: "The email or password you entered is invalid.")
    }
    
    @IBAction func showNotificationBelow() {
        let backgroundColor = UIColor(hex: "2AC38E")
        
        showNotificationRelatedToView(notificationBelowButton, isAbove: false, padding: 20, emoji: "💌", backgroundColor: backgroundColor, text: "Email with instructions to reset your password has been sent to email provided by you during the registration proccess.\nPlease, check spam folder in case you don't see this email.", textColor: .black)
    }
}
