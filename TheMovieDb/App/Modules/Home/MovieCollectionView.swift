//
//  MovieCollectionView.swift
//  TheMovieDb
//
//  Created by Vineal Viji Varghese on 15/05/21.
//

import UIKit

protocol MovieInteractorDelegate{
    func fecthMovies()
}

class MovieCollectionView: UICollectionView {
    private var movieList: [MovieViewModel] = []
    var movieDelegate: MovieInteractorDelegate?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let movieConfig = MovieConfigurator.init()
        movieConfig.configure(self)
        self.movieDelegate?.fecthMovies()
        self.dataSource = self
    }
}

//MARK:- CollectionView DataSource Methods
extension MovieCollectionView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! MovieCollectionViewCell
        
        cell.setLabel(label: movieList[indexPath.row].title)
        return cell
        
    }
}

//MARK:- MoviePresenterOutput
extension MovieCollectionView :MoviePresenterOutput{
    func presentMovieData(movieList: [MovieViewModel]) {
        self.movieList = movieList
    }
}
