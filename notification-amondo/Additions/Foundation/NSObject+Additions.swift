//
//  NSObject+Additions.swift
//  notification-amondo
//
//  Created by Val on 7/11/18.
//  Copyright © 2018 frolapps. All rights reserved.
//

import Foundation

extension NSObject {
    
    static var classIdentifier: String {
        return String(describing: self)
    }
}
