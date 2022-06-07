//
//  ConnectionManager.swift
//  PruebaCine
//
//  Created by mespinal on 6/06/22.
//

import Foundation
import Alamofire

class ConnectionManager: ConnectionManagerProtocol {
    
    let baseUrl = "\(Constants.ConnectionUrl.baseUrl)"
    
    func getMovieList(handler: @escaping (MoviesResponse?, NSError?) -> Void) {
        
        let url = "\(baseUrl)\(Constants.ConnectionUrl.moviesUrl)?page=1&api_key=\(Constants.ConnectionUrl.urlApiKey)"
        
        AF.session.configuration.timeoutIntervalForRequest = 10
        
        AF.request(url).validate().responseDecodable(of: MoviesResponse.self) { (response) in
            
            switch response.result {
            case .success(let value):
                handler(value, nil)
            case .failure(let error):
                let newError = NSError(domain: url, code: (response.response?.statusCode ?? 0)!, userInfo:[NSLocalizedDescriptionKey:error.localizedDescription])
                    
                handler(nil, newError)
            }
        }
    }
}
