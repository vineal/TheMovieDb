//
//  MovieCollectionView.swift
//  TheMovieDb
//
//  Created by Vineal Viji Varghese on 15/05/21.
//

import UIKit

class MovieCollectionView: UICollectionView {
    private var labels = ["Fight Club", "Inception", "Inglorious Bastards", "Man of Steel", "Dark Night"]

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
    }
}

//MARK:- CollectionView DataSource Methods
extension MovieCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! MovieCollectionViewCell
        
        cell.setLabel(label: labels[indexPath.row])
        return cell
        
    }
}


