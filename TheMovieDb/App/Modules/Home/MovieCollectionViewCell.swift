//
//  MovieCollectionViewCell.swift
//  TheMovieDb
//
//  Created by Vineal Viji Varghese on 15/05/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet var movieTitle: UILabel!
        func setLabel(label:String) {
            movieTitle.text = label
        }
}
