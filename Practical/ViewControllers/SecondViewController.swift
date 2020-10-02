//
//  SecondViewController.swift
//  Practical
//
//  Created by Rohit Makwana on 02/10/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

struct DefalutFrame {

    static let defaultX : CGFloat = 20
    static let defaultY : CGFloat = 20
    static let height : CGFloat = (screenWidth-(defaultX*3.0))/2
    static var width: CGFloat {
        return (screenWidth-(defaultX*3.0))/2
    }
}

let screenWidth = UIScreen.main.bounds.size.width

class SecondViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonHolderView: UIView!
    @IBOutlet weak var buttonHolderViewHeight: NSLayoutConstraint!

    //MARK: - Declared Variables
    static var instance : SecondViewController {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        return controller
    }

    var buttonCount: Int = 0
    private var allButtons : [CustomButton] = []
    var clickCount = 0

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layoutIfNeeded()
        self.title = "Practical"

        var count = 0
        if self.buttonCount%2 == 0 {
             count = self.buttonCount/2
        }
        else {
             count = Int(self.buttonCount/2) + 1
        }

        let viewHeight = (DefalutFrame.defaultY * CGFloat(count)) + (DefalutFrame.height * CGFloat(count))
        buttonHolderViewHeight.constant = viewHeight + 20
        var yCord : CGFloat = DefalutFrame.defaultY

        for i in 0..<self.buttonCount {

            var newX = DefalutFrame.defaultX
            if i%2 != 0 {
                newX = DefalutFrame.defaultX + DefalutFrame.width + DefalutFrame.defaultX
            }

            let frame = CGRect(x: newX, y: yCord, width: DefalutFrame.width, height: DefalutFrame.height)
            let btn = UIButton.createButton(frame)
            btn.addTarget(self, action: #selector(self.randomButtonAction(_:)), for: .touchUpInside)
            btn.tag = i + 100

            self.buttonHolderView.addSubview(btn)
            if i > 0 && i%2 != 0 {
                yCord = yCord + DefalutFrame.height + DefalutFrame.defaultY
            }
            self.allButtons.append(btn)
        }

        self.scrollView.isScrollEnabled = true
        self.perform(#selector(self.makeRandomBlue), with: nil, afterDelay: 1)
    }

    //MARK: - IBActions
    @objc fileprivate func randomButtonAction(_ button: CustomButton) {

        if button.buttonState == .blue {
            button.buttonState = .red
            self.clickCount = self.clickCount + 1
            if self.clickCount == 3 {
                self.clickCount
                    = 0
                self.perform(#selector(self.makeRandomBlue), with: nil, afterDelay: 1)
            }
        }
    }

    //MARK: - Helper Methods
    @objc fileprivate func makeRandomBlue() {

        let randomButtons = self.allButtons.filter { $0.buttonState == .white}
        let btns = randomButtons.shuffled().prefix(3)
        btns.forEach {$0.buttonState = .blue}
    }
}
