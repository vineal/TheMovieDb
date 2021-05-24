//
//  MovieWorker.swift
//  TheMovieDb
//
//  Created by Vineal Viji Varghese on 16/05/21.
//

import Foundation

protocol MovieWorkerDelegate{
    func didFetchMovieData(movieData: Movies)
}
class MovieWorker{
    var delegate : MovieWorkerDelegate?
    func getMovieData(){
        
        let urlStr = "https://api.themoviedb.org/3/movie/popular?api_key=c52ede262e7fb7efb75e52f6117efad4&language=en-US&page=1"
        if let url = URL(string: urlStr){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(Movies.self, from: safeData)
                            self.delegate?.didFetchMovieData(movieData: results)
                        }
                        catch{
                            debugPrint(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
