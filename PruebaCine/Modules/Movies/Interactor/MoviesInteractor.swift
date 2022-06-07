//
//  MoviesInteractor.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import Foundation

class MoviesInteractor: MoviesInteractorProtocol {
    
    var connectionManager: ConnectionManagerProtocol?
    
    var presenter: MoviesPresenterProtocol?
    
    init(presenter: MoviesPresenterProtocol) {
        
        self.presenter = presenter
    }
    
    func getMovieList() {
        
        connectionManager = ConnectionManager()
        
        connectionManager?.getMovieList() { (response, error) in
            
            if let moviesResponse = response {
                
                self.presenter?.didGetMovieList(movieList: moviesResponse)
            }
            
            if let error = error {
                
                self.presenter?.failGetMovieList(error: error)
            }
        }
    }
}
