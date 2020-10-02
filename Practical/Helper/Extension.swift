//
//  Extension.swift
//  Practical
//
//  Created by Rohit Makwana on 02/10/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

extension String {

   var isNumeric: Bool {
     return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
   }
}

extension UIButton {

    static func createButton(_ frame: CGRect) -> CustomButton {

        let btn = CustomButton(frame: frame)
        btn.layer.cornerRadius = 5
        btn.buttonState = .white
        btn.setTitle("", for: .normal)
        return btn
    }
}

extension UIWindow {

    static var key : UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        }
        else {
            return UIApplication.shared.keyWindow
        }
    }
}
