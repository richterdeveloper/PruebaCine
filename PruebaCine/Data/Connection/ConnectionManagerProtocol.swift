//
//  ConnectionManagerProtocol.swift
//  PruebaCine
//
//  Created by mespinal on 4/06/22.
//

import Foundation

protocol ConnectionManagerProtocol {
    
    func getMovieList(handler: @escaping (MoviesResponse?, NSError?) -> Void)
}
