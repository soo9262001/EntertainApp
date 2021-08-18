//
//  MovieAPINetworkManager.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import Foundation
import Moya

class MovieAPINetworkManager {
    
    static let provider = MoyaProvider<MovieAPI>()
    
    static func MovieDatas(source: MovieAPI, completion: @escaping([Movie]) -> ()) {
        provider.request(source) { results in
            switch results {
            case .success(let response):
                do {
                    let movieData = try JSONDecoder().decode(MovieData.self, from: response.data)
                    print(movieData)
                    completion(movieData.results)
                }catch let err{
                    print(err.localizedDescription)
                    
                }

                return
            case .failure(let err):
                print(err.localizedDescription)
                return
            }
        }
    }
    
    static func detailMovieData(movieId: Int, completion: @escaping(DetailMovie) -> ()) {
        provider.request(.detail(id: movieId)) { result in
            switch result {
            case .success(let response):
                do {
                    let detailMovieData = try JSONDecoder().decode(DetailMovie.self, from: response.data)
                    
                    completion(detailMovieData)
                }catch let error {
                    print(error.localizedDescription)
                }
                return
            case .failure(let err):
                print(err.localizedDescription)
                return
            }
        }
    }
    
    
    
    
}
