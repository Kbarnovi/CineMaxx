//
//  HomePageViewController.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 20.03.25.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: GetMoviesResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchMovies()
    }
    
    
    private func fetchMovies() {
        Task {
            if let fetchedMovies = await getMoviesByGenre(genreID: 35) {
                updateUI(with: fetchedMovies)
            }
        }
    }
    
    private func updateUI(with movies: GetMoviesResponse) {
        DispatchQueue.main.async {
            self.movies = movies
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.results.count ?? 0  // Prevents crash if movies is nil
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("clicking")
        guard let movies = movies else { return }  // Ensure movies is not nil
    
        // Instantiate the DetailViewController from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            // Pass the selected movie data to the DetailViewController
            detailVC.movie = movies.results[indexPath.row]  // Set the movie property
            
            // Navigate to the DetailViewController
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let movies = movies else { return UICollectionViewCell() }  // Ensure movies is not nil
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCollectionViewCell", for: indexPath) as! HomePageCollectionViewCell
        // Configure your cell
        cell.setup(with: movies.results[indexPath.row])
        
        return cell
    }
}

