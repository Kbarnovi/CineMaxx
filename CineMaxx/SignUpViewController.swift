////
////  SignUpViewController.swift
////  CineMaxx
////
////  Created by Ketevan Barnovi on 19.03.25.
////
//

import UIKit
import Security

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.becomeFirstResponder()
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        

        [nameTextField, surnameTextField, emailTextField, passwordTextField, confirmPasswordTextField].forEach {
            $0?.delegate = self
            $0?.autocorrectionType = .no
            $0?.spellCheckingType = .no
        }

        setGradientBackground()
        

        [nameTextField, surnameTextField, emailTextField, passwordTextField, confirmPasswordTextField].forEach {
            $0?.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        }

        setPlaceholderText()
    }

    func setPlaceholderText() {
        let placeholderColor = UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 0.6)
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        surnameTextField.attributedPlaceholder = NSAttributedString(string: "Surname", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        confirmPasswordTextField.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let surname = surnameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        

        if name.isEmpty || surname.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            showAlert(message: "Please fill in all fields")
            return
        }
        

        if password != confirmPassword {
            showAlert(message: "Passwords do not match")
            return
        }


        if password.count < 8 {
            showAlert(message: "Password must be at least 8 characters")
            return
        }
        
//        // Save email and password securely in Keychain
//        saveToKeychain(email: email, password: password)
//        
//        // Navigate to Sign In screen
//        navigateToSignIn()
    }
    
//    // Save email and password to Keychain
//    func saveToKeychain(email: String, password: String) {
//        let emailData = email.data(using: .utf8)!
//        let passwordData = password.data(using: .utf8)!
//        
//        let emailQuery: [CFString: Any] = [
//            kSecClass: kSecClassGenericPassword,
//            kSecAttrAccount: "email",
//            kSecValueData: emailData
//        ]
//        
//        let passwordQuery: [CFString: Any] = [
//            kSecClass: kSecClassGenericPassword,
//            kSecAttrAccount: "password",
//            kSecValueData: passwordData
//        ]
//        
//        SecItemDelete(emailQuery as CFDictionary) // Remove old entry
//        SecItemDelete(passwordQuery as CFDictionary) // Remove old entry
//        
//        SecItemAdd(emailQuery as CFDictionary, nil) // Add new email
//        SecItemAdd(passwordQuery as CFDictionary, nil) // Add new password
//    }
    
    // Show alert message
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // Handle return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFields: [UITextField] = [nameTextField, surnameTextField, emailTextField, passwordTextField, confirmPasswordTextField]
        
        if let index = textFields.firstIndex(of: textField), index < textFields.count - 1 {
            textFields[index + 1].becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            signUpTapped(UIButton()) // Trigger sign up
        }
        return true
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let signInVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            navigationController?.pushViewController(signInVC, animated: true)
        }
    }


    func setGradientBackground() {
        let colorTop = UIColor(red: 132.0/255, green: 104.0/255, blue: 212.0/255, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 39.0/255, green: 16.0/255, blue: 107.0/255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // Navigate to Sign In screen
    func navigateToSignIn() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let signInVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            navigationController?.pushViewController(signInVC, animated: true)
            
        }
    }
}

