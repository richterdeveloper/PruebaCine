//
//  MoviesProtocol.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import Foundation

protocol MoviesConfiguratorProtocol {
    
    func configure(viewController: MoviesViewController)
}

protocol MoviesViewProtocol: AnyObject {
    
    func showBasicAlert(title:String?, message: String?)
    func showMovieList()
    
}

protocol MoviesPresenterProtocol {
    
    func getMovieList()
    func didGetMovieList(movieList: MoviesResponse)
    func failGetMovieList(error: NSError)
    
    func getMovies() -> [MovieModel]
    
    func goToDetail(movie: MovieModel)
}

protocol MoviesInteractorProtocol {
    
    func getMovieList()
}

protocol MoviesRouterProtocol {
    
    func goToMovieDetail(originViewController: MoviesViewController, movieViewModel: MovieViewModel)
}
