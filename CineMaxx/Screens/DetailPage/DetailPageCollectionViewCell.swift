//
//  DetailPageCollectionViewCell.swift
//  CineMaxx
//
//  Created by Ketevan Barnovi on 25.03.25.
//

import UIKit


class DetailPageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLb1: UILabel!
    
    func setup(_ data: Cast) {
        let unwrappedImageUrl = data.profilePath ?? ""
        movieImageView.loadImage(from: "https://image.tmdb.org/t/p/w500\(unwrappedImageUrl)")
        titleLb1.text = data.name
    }
}
