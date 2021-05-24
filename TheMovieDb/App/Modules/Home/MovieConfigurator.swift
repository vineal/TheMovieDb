//
//  MovieConfigurator.swift
//  TheMovieDb
//
//  Created by Vineal Viji Varghese on 24/05/21.
//

import Foundation
class MovieConfigurator{
    func configure(_ viewController : MovieCollectionView){
        let presenter = MoviePresenter()
        presenter.delegate = viewController
        
        let interactor = MovieInteractor()
        interactor.delegate = presenter
        
        viewController.movieDelegate = interactor
    }
}
