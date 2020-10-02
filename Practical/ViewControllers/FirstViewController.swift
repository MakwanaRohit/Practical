//
//  FirstViewController.swift
//  Practical
//
//  Created by Rohit Makwana on 02/10/20.
//  Copyright © 2020 Rohit Makwana. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet fileprivate weak var numberTextField: UITextField!
    @IBOutlet fileprivate weak var okButton: UIButton!
    
    //MARK: - Declared Variables
    private let cornerRadius : CGFloat = 10

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setDesignLayout()
    }
    
    //MARK: - IBActions
    @IBAction private func okButtonAction(_ sender: Any) {

        self.numberTextField.resignFirstResponder()
        let text = self.numberTextField.text!
        if !text.isEmpty {
            if text.isNumeric {
                self.numberTextField.text = ""
                let controller = SecondViewController.instance
                controller.buttonCount = Int(text) ?? 0
                self.navigationController?.pushViewController(controller, animated: true)
            }
            else {
                self.displayAlert(AlertMessage.onlyNumeric)
            }
        }
        else {
            self.displayAlert(AlertMessage.noValue)
        }
    }

    //MARK: - Helper Methods
    fileprivate func setDesignLayout() {

        self.numberTextField.layer.cornerRadius = self.cornerRadius
        self.numberTextField.layer.borderColor = UIColor.gray.cgColor
        self.numberTextField.layer.borderWidth = 1
        self.numberTextField.layer.masksToBounds = true
        self.okButton.layer.cornerRadius = self.cornerRadius
    }
    
    private func displayAlert(_ message: String) {

        let alert = UIAlertController(title: Titles.error, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Titles.ok, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

