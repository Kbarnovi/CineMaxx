//
//  HomePageViewController.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 20.03.25.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()
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

