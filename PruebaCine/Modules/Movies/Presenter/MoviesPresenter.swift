//
//  MoviesPresenter.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import Foundation

class MoviesPresenter: MoviesPresenterProtocol {
    
    weak var moviesView: MoviesViewProtocol!
    var interactor: MoviesInteractorProtocol?
    var router: MoviesRouterProtocol?
    
    var movieList: [MovieModel] = []
    var totalPages: Int = 0
    var page: Int = 0
    
    init(view: MoviesViewProtocol) {
        self.moviesView = view
        self.interactor = MoviesInteractor(presenter: self)
        self.router = MoviesRouter(withView: self.moviesView)
    }
    
    func getMovieList() {
        
        interactor?.getMovieList()
    }
    
    func didGetMovieList(movieList: MoviesResponse) {
        
        self.movieList = movieList.results ?? []
        self.totalPages = movieList.total_pages ?? 0
        page = movieList.page ?? 0
        
        moviesView.showMovieList()
    }
    
    func failGetMovieList(error: NSError) {
        
        moviesView.showBasicAlert(title: "Error", message: error.localizedDescription)
    }
    
    func goToDetail(movie: MovieModel) {
        
        let movieViewModel = MovieViewModel(title: movie.title,
                                       poster: "\(Constants.ConnectionUrl.imageHostUrl)\(movie.poster_path!)",
                                       voteAverage: movie.vote_average,
                                       releaseDate: movie.release_date,
                                       overview: movie.overview)
        
        router?.goToMovieDetail(originViewController: moviesView as! MoviesViewController, movieViewModel: movieViewModel)
    }
    
    func getMovies() -> [MovieModel] {
        
        return movieList
    }
}
