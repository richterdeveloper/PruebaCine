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
    func showMovieList(fromSaved: Bool)
}

protocol MoviesPresenterProtocol {
    
    func getMovieList()
    func didGetMovieList(movieList: MoviesResponse)
    func failGetMovieList(error: NSError)
    
    func getMovies() -> [MovieModel]
    func getSearchedMovies() -> [MovieModel]
    func putNewSearchedMoview(movie: MovieModel)
    func setSearchedMovies(movies: [MovieModel])
    func clearSearchedMovies()
    func getPage() -> Int
    func getTotalPages() -> Int
    
    func saveMovie(movie: MovieModel)
    
    func goToDetail(movie: MovieModel)
}

protocol MoviesInteractorProtocol {
    
    func getMovieList(page: Int)
}

protocol MoviesRouterProtocol {
    
    func goToMovieDetail(originViewController: MoviesViewController, movieViewModel: MovieViewModel)
}
