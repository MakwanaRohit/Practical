//
//  ButtonState.swift
//  Practical
//
//  Created by Rohit Makwana on 02/10/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

enum ButtonState {
    case white
    case blue
    case red
    
    var BGColor : UIColor {
        switch self {
        case .white:
            return .white
        case .blue:
            return .blue
        case .red:
            return .red
        }
    }
}
