//
//  HomePageCollectionViewCell.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 24.03.25.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieTitleView: UILabel!
    
    func setup(with movie: Movie) {
        print("Image: \(movie.image)")

        imageView.image = movie.image
        movieTitleView.text = movie.title
    }
}
