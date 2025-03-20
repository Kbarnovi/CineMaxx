//
//  ViewController.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 19.03.25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.becomeFirstResponder()
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        
        setGradientBackground()
        
        emailTextField.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        passwordTextField.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 0.6)]
        )
        
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 235/255, green: 235/255, blue: 245/255, alpha: 0.6)]
        ) 
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



