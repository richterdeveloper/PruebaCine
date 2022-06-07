//
//  MoviesRouter.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import Foundation
import UIKit

class MoviesRouter {
    
    private weak var moviesViewProtocol: MoviesViewProtocol!
    
    init(withView view: MoviesViewProtocol) {
        self.moviesViewProtocol = view
    }
}

extension MoviesRouter: MoviesRouterProtocol {
    
    func goToMovieDetail(originViewController: MoviesViewController, movieViewModel: MovieViewModel) {
        
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        let destinyViewController = storyboard.instantiateViewController(withIdentifier: "DetailMovieViewController") as! DetailMovieViewController
        destinyViewController.movieViewModel = movieViewModel
        
        originViewController.navigationController?.pushViewController(destinyViewController, animated: true)
    }
}
