//
//  MoviesResponse.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import Foundation

struct MoviesResponse: Decodable {
    
    var page: Int?
    var results: [MovieModel]?
    var total_pages: Int?
    var total_results: Int?
}
