//
//  MovieViewModel.swift
//  PruebaCine
//
//  Created by mespinal on 7/06/22.
//

import Foundation

struct MovieViewModel {
    
    var title: String?
    var poster: String?
    var voteAverage: Double?
    var releaseDate: String?
    var overview: String?
    
    init(title: String?, poster: String?, voteAverage: Double?, releaseDate: String?, overview: String?) {
        
        self.title = title
        self.poster = poster
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
        self.overview = overview
    }
}
