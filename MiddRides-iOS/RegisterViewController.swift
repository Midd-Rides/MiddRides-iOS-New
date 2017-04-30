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
    @IBOutlet var backToLoginButton: UIButton!
    
    var agent = NetworkUtil.getInstance()
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if validateCredentials() {
            register()
        }
    }
    
    @IBAction func didTouchOutside(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true);
    }
    
    private func register() {
        agent.attemptRegistering(email: emailField.text!, password: Privacy.encodePassword(passwordToEncode: passwdField.text!), callback: {
            response in
            guard let jsonData = DataUtil.extractJsonFromResponse(response) else {
                AppUtil.displayAlertMessage(title: "Register Failed", msg: "Failed to register for unknown reasons", action: UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil), context: self);
                return
            }
            
            // check for errors
            if (jsonData["error"] as! String) == "" || (jsonData["error"] as! String).characters.count <= 0 {
                self.performSegue(withIdentifier: "fromRegisterToMain", sender: nil);
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
        // check for password match
        if passwdField.text! != confirmField.text! {
            AppUtil.displayAlertMessage(title: "Format Error", msg: "Passwords do not match", action: UIAlertAction(title: "OK", style: .default), context: self)
            return false
        }
        
        return true
    }
    
    @IBAction func unwindToLoginView(_ sender: Any) {
        performSegue(withIdentifier: "unwindToLoginView", sender: self);
    }
    
}
