//
//  MoviesConfigurator.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import Foundation

class MoviesConfigurator: MoviesConfiguratorProtocol {
    
    func configure(viewController: MoviesViewController) {
        
        viewController.presenter = MoviesPresenter(view: viewController)
    }
}
