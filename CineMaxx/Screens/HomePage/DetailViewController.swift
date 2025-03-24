
//
//  HomePageCollectionViewCell.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 24.03.25.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movie: Result?  // Store the movie data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Now that the view is loaded, call setup
        if let movie = movie {
            setup(with: movie)
        }
    }
    
    
    func setup(with movie: Result) {
        movieImage.loadImage(from: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
        movieTitle.text = movie.title
    }
}
