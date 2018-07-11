//
//  ViewController.swift
//  notification-amondo
//
//  Created by Val on 7/11/18.
//  Copyright © 2018 frolapps. All rights reserved.
//

import UIKit

private struct Constants {
    static let notificationTrailingConstant: CGFloat = -20
    static let notificationLeadingConstant: CGFloat = 20
}

class ViewController: UIViewController {
    
    func showNotificationRelatedToView(_ relatedView: UIView, isAbove: Bool, padding: CGFloat, emoji: String, backgroundColor: UIColor, text: String, textColor: UIColor? = nil, secondsToDisappear: Int? = nil) {
        let image = emoji.emojiToImage()
        
        showNotificationRelatedToView(relatedView, isAbove: isAbove, padding: padding, image: image, backgroundColor: backgroundColor, text: text, textColor: textColor, secondsToDisappear: secondsToDisappear)
    }
    
    private func showNotificationRelatedToView(_ relatedView: UIView, isAbove: Bool, padding: CGFloat, image: UIImage?, backgroundColor: UIColor, text: String, textColor: UIColor? = nil, secondsToDisappear: Int? = nil) {
        
        let notificationView = NotificationView.instantiateFromNib()
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notificationView)
        
        view.addConstraint(NSLayoutConstraint(item: notificationView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: Constants.notificationTrailingConstant))
        view.addConstraint(NSLayoutConstraint(item: notificationView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: Constants.notificationLeadingConstant))
        
        
        if isAbove {
            view.addConstraint(NSLayoutConstraint(item: notificationView, attribute: .bottom, relatedBy: .equal, toItem: relatedView, attribute: .top, multiplier: 1, constant: -padding))
        } else {
            view.addConstraint(NSLayoutConstraint(item: notificationView, attribute: .top, relatedBy: .equal, toItem: relatedView, attribute: .bottom, multiplier: 1, constant: padding))
        }
        
        notificationView.configure(image: image, backgroundColor: backgroundColor, text: text, textColor: textColor, secondsToDisappear: secondsToDisappear)
    }
}
