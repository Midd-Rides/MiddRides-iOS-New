//
//  RegisterViewController.swift
//  MiddRides-iOS
//
//  Created by Tao Wang on 4/14/17.
//  Copyright © 2017 Middle Endian. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwdField: UITextField!
    @IBOutlet var confirmField: UITextField!
    
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    var agent = NetworkUtil.getInstance()
 
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func unwindToLoginView(_ sender: Any) {
        performSegue(withIdentifier: "unwindToLoginView", sender: self);
    }
    
}
