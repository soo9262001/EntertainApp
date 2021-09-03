//
//  TvAPI.swift
//  MovieApp
//
//  Created by kms on 2021/08/18.
//

import Foundation
import Moya

enum TvAPI {
    case popular
    case ontheair
    case detail(id:Int)
}

extension TvAPI : TargetType {
    var baseURL: URL {
        guard let url = URL(string: R.BaseURL.tvURl) else { fatalError("URL Error")
        }
        return url
    }
    
    var path: String {
        switch self{
        case .popular:
            return "/popular"
        case .ontheair:
            return "/on_the_air"
        case .detail(let id):
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
        switch self {
        case .popular, .ontheair:
            return .requestParameters(parameters: ["api_key" : "0e9447a2d2567ef3bd00018aca6d17a2"], encoding: URLEncoding.queryString)
        case .detail(let id):
            return .requestParameters(parameters: ["api_key" : "0e9447a2d2567ef3bd00018aca6d17a2", "tv_id" : id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["contenttype" : "application/json"]
    }
    
    
}
