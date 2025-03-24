//
//  HomePageViewController.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 20.03.25.
//

import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        
        fetchMovies()
    }
    
    
    private func fetchMovies() {
        Task {
            if let fetchedMovies = await fetchWelcomeMessage() {
                updateUI(with: fetchedMovies)
            }
        }
    }
    
    private func updateUI(with movies: Welcome) {
        DispatchQueue.main.async {
            self.movies = movies
            self.collectionView.reloadData()
        }
    }
    
}

extension HomePageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.results.count ?? 0  // Prevents crash if movies is nil
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let movies = movies else { return UICollectionViewCell() }  // Ensure movies is not nil
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCollectionViewCell", for: indexPath) as! HomePageCollectionViewCell
        cell.setup(with: movies.results[indexPath.row])
        return cell
    }
}

