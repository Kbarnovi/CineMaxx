
//
//  HomePageCollectionViewCell.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 24.03.25.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var blurredImage: UIImageView!
    var backgroundImageView: UIImageView!
    
    
    var movie: Result?  // Store the movie data
    var cast: CastResponse?  // Store the movie data
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        detailCollectionView.collectionViewLayout = layout
        
        
        blurredImage.frame = view.bounds
        blurredImage.contentMode = .scaleAspectFill
        
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurEffectView.frame = view.bounds
        blurredImage.addSubview(blurEffectView)
        
        
        // Now that the view is loaded, call setup
        if let movie = movie {
            setup(with: movie)
            fetchMovies(movie.id)
        }
    }
    
    private func fetchMovies(_ id: Int) {
        Task {
            if let fetchedCast = await GetCredits(movieID: id) {
                updateUI(with: fetchedCast)
            }
        }
    }
    
    private func updateUI(with cast: CastResponse) {
        DispatchQueue.main.async {
            self.cast = cast
            self.detailCollectionView.reloadData()
        }
    }
    
    
    func setup(with movie: Result) {
        movieImage.loadImage(from: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
        blurredImage.loadImage(from: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
        movieTitle.text = movie.title
        movieDescription.text = movie.overview
        releaseDate.text = movie.releaseDate
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cast?.cast.count ?? 0  // Prevents crash if movies is nil
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cast = cast?.cast else { return UICollectionViewCell() }  // Ensure movies is not nil
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailPageCollectionViewCell", for: indexPath) as! DetailPageCollectionViewCell
        
        cell.setup(cast[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170*0.6667, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Adjust leading and trailing space
    }
}
