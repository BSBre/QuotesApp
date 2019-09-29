//
//  RegisterController.swift
//  QuotesApp
//
//  Created by Bojan Savic on 9/17/19.
//  Copyright © 2019 Bojan Savic. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var firstNameTextField: DesignableTextField!
    @IBOutlet weak var surnameTextField: DesignableTextField!
    @IBOutlet weak var dateOfBirthDatePicker: UIDatePicker!
    
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var repeatPasswordTextField: DesignableTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func firstNameTextFieldTouched(_ sender: Any) {
        firstNameTextField.backgroundColor = firstNameTextField.normalBackgroundColor
        firstNameTextField.placeholder = "Name"
    }
    
    @IBAction func surnameTextFieldTouched(_ sender: Any) {
        surnameTextField.backgroundColor = surnameTextField.normalBackgroundColor
        surnameTextField.placeholder = "Surname"
    }
    @IBAction func emailTextFieldTouched(_ sender: Any) {
        emailTextField.backgroundColor = emailTextField.normalBackgroundColor
        emailTextField.placeholder = "Email"
    }
    @IBAction func passwordTextFieldTouched(_ sender: Any) {
        passwordTextField.backgroundColor = passwordTextField.normalBackgroundColor
        passwordTextField.placeholder = "Password"
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        let user = User()
        
        if let firstName = firstNameTextField.text, firstName != "" {
            user.firstName = firstName
        } else {
            firstNameTextField.backgroundColor = firstNameTextField.errorBackgroundColor
            firstNameTextField.placeholder = "Required."
            animate(textField: firstNameTextField)
        }
        if let lastName = surnameTextField.text, lastName != "" {
            user.lastName = lastName
        } else {
            surnameTextField.backgroundColor = surnameTextField.errorBackgroundColor
            surnameTextField.placeholder = "Required."
            animate(textField: surnameTextField)
        }
        if let email = emailTextField.text, email != "" {
            user.email = email
        } else {
            emailTextField.backgroundColor = emailTextField.errorBackgroundColor
            emailTextField.placeholder = "Email required."
            animate(textField: emailTextField)
        }
        if let password = passwordTextField.text, password != "" {
            if let repeatPassword = repeatPasswordTextField.text, repeatPassword != "" {
                if password == repeatPassword {
                    user.password = password
                } else{
                    repeatPasswordTextField.text = ""
                    repeatPasswordTextField.backgroundColor = repeatPasswordTextField.errorBackgroundColor
                    repeatPasswordTextField.placeholder = "Passowrd must match."
                    animate(textField: repeatPasswordTextField)
                }
            } else {
                repeatPasswordTextField.backgroundColor = repeatPasswordTextField.errorBackgroundColor
                repeatPasswordTextField.placeholder = "Passowrd must match."
                animate(textField: repeatPasswordTextField)
            }
        } else {
            passwordTextField.backgroundColor = passwordTextField.errorBackgroundColor
            passwordTextField.placeholder = "Password required."
            animate(textField: passwordTextField)
        }
        
        // Check the database
    }
    
    func animate(textField: DesignableTextField) {
        textField.resignFirstResponder()
        UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            textField.center.x += 10
        }, completion: nil)
        UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            textField.center.x -= 20
        }, completion: nil)
        UIView.animate(withDuration: 0.1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            textField.center.x += 10
        }, completion: nil)
    }
}
