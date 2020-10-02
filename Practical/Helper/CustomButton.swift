//
//  CustomButton.swift
//  Practical
//
//  Created by Rohit Makwana on 02/10/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    var buttonState: ButtonState? {
        didSet {
            if let state = self.buttonState {
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                    self.backgroundColor = state.BGColor
                    self.isUserInteractionEnabled = state != .white
                }) { (done) in
                }
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
