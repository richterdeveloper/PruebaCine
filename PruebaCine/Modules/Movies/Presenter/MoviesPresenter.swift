//
//  MoviesPresenter.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import Foundation
import CoreData

class MoviesPresenter: MoviesPresenterProtocol {
    
    weak var moviesView: MoviesViewProtocol!
    var interactor: MoviesInteractorProtocol?
    var router: MoviesRouterProtocol?
    
    var movieList: [MovieModel] = []
    var searchMovieList: [MovieModel] = []
    var totalPages: Int = 0
    var page: Int = 0
    
    init(view: MoviesViewProtocol) {
        self.moviesView = view
        self.interactor = MoviesInteractor(presenter: self)
        self.router = MoviesRouter(withView: self.moviesView)
    }
    
    func getMovieList() {
        
        interactor?.getMovieList(page: self.page + 1)
    }
    
    func didGetMovieList(movieList: MoviesResponse) {
        
        self.movieList.append(contentsOf: movieList.results ?? [])
        self.searchMovieList.append(contentsOf: movieList.results ?? [])
        self.totalPages = movieList.total_pages ?? 0
        page = movieList.page ?? 0
        
        moviesView.showMovieList(fromSaved: false)
    }
    
    func failGetMovieList(error: NSError) {
        
        movieList.removeAll()
        searchMovieList.removeAll()
        
        let savedMovies = DataManager.shared.movies()
        
        if savedMovies.count > 0 {
            
            for savedMovie in savedMovies {
                
                var movie = MovieModel()
                movie.id = savedMovie.id
                movie.title = savedMovie.title
                movie.original_title = savedMovie.original_title
                movie.release_date = savedMovie.release_date
                movie.overview = savedMovie.overview
                movie.vote_average = savedMovie.vote_average
                movie.poster_path = savedMovie.poster_path
                
                movieList.append(movie)
                searchMovieList.append(movie)
            }
            
            moviesView.showMovieList(fromSaved: true)
        }
        
        moviesView.showBasicAlert(title: "Error", message: error.localizedDescription)
    }
    
    func goToDetail(movie: MovieModel) {
        
        let movieViewModel = MovieViewModel(title: movie.title,
                                       poster: "\(Constants.ConnectionUrl.imageHostUrl)\(movie.poster_path ?? "")",
                                       voteAverage: movie.vote_average,
                                       releaseDate: movie.release_date,
                                       overview: movie.overview)
        
        router?.goToMovieDetail(originViewController: moviesView as! MoviesViewController, movieViewModel: movieViewModel)
    }
    
    func getMovies() -> [MovieModel] {
        
        return movieList
    }
    
    func getSearchedMovies() -> [MovieModel] {
        
        return searchMovieList
    }
    
    func clearSearchedMovies() {
        
        searchMovieList.removeAll()
    }
    
    func putNewSearchedMoview(movie: MovieModel) {
        
        searchMovieList.append(movie)
    }
    
    func setSearchedMovies(movies: [MovieModel]) {
        
        self.searchMovieList.removeAll()
        self.searchMovieList.append(contentsOf: movies)
    }
    
    func getPage() -> Int {
        
        return self.page
    }
    
    func getTotalPages() -> Int {
        
        return self.totalPages
    }
    
    func saveMovie(movie: MovieModel) {
        
        let movieToSave = DataManager.shared.movie(
            id: movie.id ?? 0,
            title: movie.title ?? "",
            original_title: movie.original_title ?? "",
            overview: movie.overview ?? "",
            release_date: movie.release_date ?? "",
            poster_path: movie.poster_path ?? "",
            vote_average: movie.vote_average ?? 0)
        
        DataManager.shared.save()
    }
}
