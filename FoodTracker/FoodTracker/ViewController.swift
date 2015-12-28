//
//  ViewController.swift
//  FoodTracker
//
//  Created by Stefan on 28.12.15.
//  Copyright © 2015 Stefan Billeb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: Actions
    
    @IBAction func setDefaultLabelText(sender: AnyObject) {
        nameLabel.text = "Default Meal name"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the user input on textfield through delegate callback (self == this)
        nameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        nameLabel.text = textField.text
    }

}

