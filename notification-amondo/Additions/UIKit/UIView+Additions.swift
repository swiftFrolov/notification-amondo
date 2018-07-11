//
//  UIView+Additions.swift
//  notification-amondo
//
//  Created by Val on 7/11/18.
//  Copyright © 2018 frolapps. All rights reserved.
//

import UIKit

extension UIView {
    
    static var nib: UINib {
        return UINib(nibName: classIdentifier, bundle: nil)
    }
    
    static func instantiateFromNib() -> Self {
        let nib = UINib(nibName: classIdentifier, bundle: nil)
        
        func instantiateFromNib<T: UIView>() -> T {
            guard let instantiatedView = nib.instantiate() as? T else { fatalError() }
            return instantiatedView
        }
        
        return instantiateFromNib()
    }
}
