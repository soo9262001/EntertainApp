//
//  MovieAPI.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import Foundation
import Moya

enum MovieAPI {
    case toprated
    case nowplaying
    case detail(id: Int)
}

extension MovieAPI : TargetType {
    var baseURL: URL {
        guard let url = URL(string: R.BaseURL.movieURL) else { fatalError("URL Error") }
        return url
    }
    
    var path: String {
        switch self{
        case .toprated :
            return "/top_rated"
        case .nowplaying :
            return "/now_playing"
        case .detail(let id) :
            return "\(id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self{
        case .nowplaying, .toprated :
            return .requestParameters(parameters: ["api_key" : "0e9447a2d2567ef3bd00018aca6d17a2"], encoding: URLEncoding.queryString)
        case .detail(let id):
            return .requestParameters(parameters: ["api_key" : "0e9447a2d2567ef3bd00018aca6d17a2", "movie_id" : id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["contenttype" : "application/json"]
    }
    
    
}

