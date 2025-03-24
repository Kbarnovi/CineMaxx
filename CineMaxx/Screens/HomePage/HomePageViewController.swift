//
//  HomePageViewController.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 20.03.25.
//

import UIKit

class HomePageViewController: UIViewController {


    @IBOutlet weak var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.dataSource = self
        
        
    }
    
}

extension HomePageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count//it returns as much cell as we have in our movies's file
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCollectionViewCell", for: indexPath) as! HomePageCollectionViewCell
        cell.setup(with: movies[indexPath.row])
        return cell
    }
}
