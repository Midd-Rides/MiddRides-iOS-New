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
                self.loginButton.isEnabled = true
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
        if validateCredentials() {
            login()
        }
    }
    
    @IBAction func didTouchOutside(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true);
    }
    
    private func login() {
        agent.attemptLoggingIn(email: emailField.text!, password: passwdField.text!, callback: {
            response in
            guard let jsonData = DataUtil.extractJsonFromResponse(response) else {
                AppUtil.displayAlertMessage(title: "Login Failed", msg: "Failed to log in for unknown reasons", action: UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil), context: self);
                return
            }
            
            // check for errors
            if (jsonData["error"] as! String) == "" || (jsonData["error"] as! String).characters.count <= 0 {
                // TODO: log in successful
            } else {
                AppUtil.displayAlertMessage(title: "Error", msg: (jsonData["error"] as! String), action: UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil), context: self)
            }
        })
    }
    
    // check if all inputs meet format requirements
    private func validateCredentials() -> Bool {
        // general email format
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailTest.evaluate(with: emailField.text) {
            AppUtil.displayAlertMessage(title: "Format Error", msg: "Email format incorrect", action: UIAlertAction(title: "OK", style: .default), context: self)
            return false
        }
        // check for Middlebury email
        if !emailField.text!.hasSuffix("middlebury.edu") {
            AppUtil.displayAlertMessage(title: "Format Error", msg: "Please use a Middlebury email", action: UIAlertAction(title: "OK", style: .default), context: self)
            return false
        }
        // check for password length
        if passwdField.text!.characters.count < 6 {
            AppUtil.displayAlertMessage(title: "Format Error", msg: "Password too short", action: UIAlertAction(title: "OK", style: .default), context: self)
            return false
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(emailField) {
            passwdField.becomeFirstResponder()
        }
        
        return true
    }
    
    // destination of unwind segue
    @IBAction func prepareUnwind(segue: UIStoryboardSegue) {}

}

