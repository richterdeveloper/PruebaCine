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
    
    func getMovieList(page: Int, handler: @escaping (MoviesResponse?, NSError?) -> Void) {
        
        let url = "\(baseUrl)\(Constants.ConnectionUrl.moviesUrl)?page=\(page)&api_key=\(Constants.ConnectionUrl.urlApiKey)"
        
        AF.session.configuration.timeoutIntervalForRequest = 10
        
        AF.request(url).validate().responseDecodable(of: MoviesResponse.self) { (response) in
            
            switch response.result {
            case .success(let value):
                handler(value, nil)
            case .failure(let error):
                
                var errorCode = 0
                
                if let underlyingError = error.asAFError?.underlyingError {
                    if let urlError = underlyingError as? URLError {
                        switch urlError.code {
                        case .timedOut:
                            errorCode = urlError.code.rawValue
                            print("TIMED OUT ERROR")
                        case .notConnectedToInternet:
                            errorCode = urlError.code.rawValue
                            print("INTERNET ERROR")
                        default:
                            //Do something
                            errorCode = urlError.code.rawValue
                        }
                    }
                }
                
                let newError = NSError(domain: url, code: (errorCode), userInfo:[NSLocalizedDescriptionKey:error.localizedDescription])
                    
                handler(nil, newError)
            }
        }
    }
}
