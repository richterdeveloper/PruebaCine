//
//  MovieModel.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import Foundation

struct MovieModel: Decodable {
    
    var id: Int64?
    var title: String?
    var original_title: String?
    var overview: String?
    var release_date: String?
    var poster_path: String?
    var vote_average: Double?
}
