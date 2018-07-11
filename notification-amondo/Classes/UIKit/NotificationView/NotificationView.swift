//
//  NotificationView.swift
//  notification-amondo
//
//  Created by Val on 7/11/18.
//  Copyright © 2018 frolapps. All rights reserved.
//

import UIKit

private struct Constants {
    static let cornerRadius: CGFloat = 8
    static let defaultSecondsToDisappear = 4
    static let defaultMessageLabelTextColor = UIColor.white
    
    static let animationDuration = 0.25
    static let animationVerticalDifference: CGFloat = 50
}

class NotificationView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var timer: Timer?
    var timerRunningSeconds = 0
    var secondsToDisappear = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = Constants.cornerRadius
        show()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hide(withFeedback: true)
    }
    
    @objc private func updateTimer() {
        timerRunningSeconds += 1
        
        if timerRunningSeconds >= secondsToDisappear {
            hide()
        }
    }
    
    private func show() {
        alpha = 0
        center.y += Constants.animationVerticalDifference
        
        UIView.animate(withDuration: Constants.animationDuration, animations: {
            self.alpha = 1
            self.center.y -= Constants.animationVerticalDifference
        })
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    private func hide(withFeedback: Bool = false) {
        timer?.invalidate()
        
        if withFeedback {
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        }
        
        UIView.animate(withDuration: Constants.animationDuration, animations: {
            self.alpha = 0
            self.center.y += Constants.animationVerticalDifference
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    func configure(image: UIImage?, backgroundColor: UIColor, text: String, textColor: UIColor? = nil, secondsToDisappear: Int? = nil) {
        imageView.image = image
        self.backgroundColor = backgroundColor
        messageLabel.text = text
        messageLabel.textColor = textColor ?? Constants.defaultMessageLabelTextColor
        self.secondsToDisappear = secondsToDisappear ?? Constants.defaultSecondsToDisappear
    }
}
