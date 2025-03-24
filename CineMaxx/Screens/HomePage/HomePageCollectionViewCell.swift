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
    
    func setup(with movie: Result) {
        imageView.loadImage(from: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
        movieTitleView.text = movie.title
    }
}
