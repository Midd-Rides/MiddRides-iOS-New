//
//  ViewController.swift
//  MiddRides-iOS
//
//  Created by Tao Wang on 3/30/17.
//  Copyright © 2017 Middle Endian. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwdField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
//    @IBOutlet var resetPasswdButton: UIButton!
    
    var agent: NetworkUtil = NetworkUtil.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
        passwdField.delegate = self
        
        // first check if the server is running
        loginButton.isEnabled = false
        agent.isServiceRunning(callback: {
            response in
            guard let jsonData = DataUtil.extractJsonFromResponse(response) else {
                AppUtil.displayAlertMessage(title: "Error", msg: "There is an error with the server", action: UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil), context: self)
                return
            }
            
            if jsonData["status"] as! Bool == true {
                self.loginButton.isEnabled = true
            } else {
                AppUtil.displayAlertMessage(title: nil, msg: "MiddRides is not running currently", action: nil, context: self)
            }
        })
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        login()
    }
    
    @IBAction func didTouchOutside(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true);
    }
    
    private func login() {
        // TODO: check for values
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(emailField) {
            passwdField.becomeFirstResponder()
        }
        
        return true
    }

}

