//
//  MovieInteractor.swift
//  TheMovieDb
//
//  Created by Vineal Viji Varghese on 16/05/21.
//

import Foundation


protocol MovieInteractorOutput {
    func prepareForDisplay(movieModel: Movies)
}

class MovieInteractor: MovieWorkerDelegate {
    var delegate : MovieInteractorOutput?
    private var movieWorker:MovieWorker?
    
    // MARK: - MovieWorkerDelegate Methods
    func didFetchMovieData(movieData: Movies) {
        print("didFetchMovieData")
        self.delegate?.prepareForDisplay(movieModel: movieData)
    }
}

// MARK: - MovieInteractorDelegate Methods
extension MovieInteractor : MovieInteractorDelegate{
    func fecthMovies() {
        print("fecthMovies")
        movieWorker = MovieWorker()
        movieWorker?.delegate = self
        movieWorker?.getMovieData()
    }
}
