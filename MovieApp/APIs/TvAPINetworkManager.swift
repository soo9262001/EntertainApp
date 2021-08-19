//
//  TvAPIManager.swift
//  MovieApp
//
//  Created by kms on 2021/08/18.
//

import Foundation
import Moya

class TvAPINetworkManager {
    
    static let provider = MoyaProvider<TvAPI>()
    
    static func TvDatas(source: TvAPI, completion: @escaping([Tv]) -> ()) {
        provider.request(source) { results in
            switch results {
            case .success(let response):
                do {
                    let tvData = try JSONDecoder().decode(TvData.self, from: response.data)
                    completion(tvData.results)
                }catch let err {
                    print(err.localizedDescription)
                }
                return
            case .failure(let err):
                print(err.localizedDescription)
                return
            }
        }
    }
    
    static func detailTvDatas(tvId: Int, completion: @escaping(DetailTv) -> ()) {
        provider.request(.detail(id: tvId)) { result in
            switch result {
            case .success(let response):
                do {
                    let detailTvData = try  JSONDecoder().decode(DetailTv.self, from: response.data)
                    completion(detailTvData)
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
}
