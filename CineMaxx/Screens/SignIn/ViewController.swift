//
//  ViewController.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 19.03.25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.becomeFirstResponder()
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        
        // დელეგატის მინიჭება
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
        emailTextField.autocorrectionType = .no
        emailTextField.spellCheckingType = .no
        passwordTextField.autocorrectionType = .no
        passwordTextField.spellCheckingType = .no
        
        
        setGradientBackground()
        
        emailTextField.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        passwordTextField.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        let placeholderColor = UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 0.6)
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            signUpTapped(UIButton())
        }
        return true
    }
    
    @IBAction func signinTapped(_ sender: UIButton) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            showAlert(message: "Please enter both email and password")
            return
        }
        // სატესტო მონაცემები
        let testEmail = "kbarnovi1@gmail.com"
        let testPassword = "password123"
        
        // შემოწმება
        if email == testEmail && password == testPassword {
            MoveToHomePage()
        } else {
            showAlert(message: "Incorrect email or password")
        }
        print("Email: \(email), Password: \(password)")
        
        
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        // სტორიბორდიდან "SignUpViewController" დააბრუნებს და გადაგიყვანს ახალ ეკრანზე
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
            navigationController?.pushViewController(signUpViewController, animated: true)
        }
    }
    
    func MoveToHomePage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let homePageVC = storyboard.instantiateViewController(withIdentifier: "HomePageViewController") as? HomePageViewController {
            navigationController?.pushViewController(homePageVC, animated: true)
        }
    }
    
    
    func setGradientBackground() {
        let colorTop = UIColor(red: 132.0/255, green: 104.0/255, blue: 212.0/255, alpha: 1.0) .cgColor
        let colorBottom = UIColor(red: 39.0/255, green: 16.0/255, blue: 107.0/255, alpha: 1.0) .cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}



