//
//  MoviePresenter.swift
//  TheMovieDb
//
//  Created by Vineal Viji Varghese on 16/05/21.
//

import Foundation



protocol MoviePresenterOutput{
    func presentMovieData(movieList: [MovieViewModel])
}

struct MovieViewModel {
    var title:String
    var popularity:String
    var backdrop:String
}

class MoviePresenter : MovieInteractorOutput{
    var movieList: [MovieViewModel] = []
    var delegate: MoviePresenterOutput?
    
    //Format the output in desired format into a ViewModel
    func prepareForDisplay(movieModel: Movies) {
        for movie in movieModel.results{
            var movieItem : MovieViewModel = MovieViewModel(title: "", popularity: "", backdrop: "")
            movieItem.title = movie.originalTitle
            movieItem.backdrop = movie.backdropPath
            movieItem.popularity = "\(movie.popularity)"
            movieList.append(movieItem)
        }
        self.delegate?.presentMovieData(movieList: movieList)
    }
}
