//
//  DetailMovie.swift
//  MovieApp
//
//  Created by kms on 2021/08/17.
//

import Foundation

struct DetailMovie: Codable {
    var adult: Bool
    var id: Int
    var language: String?
    var title: String?
    var overview: String?
    var popularity: Float?
    var img: String?
    var date: String?
    var average: Float?
    var count: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case adult
        case id
        case language = "original_language"
        case title
        case overview
        case popularity
        case img = "poster_path"
        case date = "release_date"
        case average = "vote_average"
        case count = "vote_count"
        
    }
    
    init(from decoder: Decoder) throws {
        let val = try decoder.container(keyedBy: CodingKeys.self)
        
        adult = try val.decode(Bool.self, forKey: .adult)
        id = try val.decode(Int.self, forKey: .id)
        language = try val.decodeIfPresent(String.self, forKey: .language)
        title = try val.decodeIfPresent(String.self, forKey: .title)
        overview = try val.decodeIfPresent(String.self, forKey: .overview)
        popularity = try val.decodeIfPresent(Float.self, forKey: .popularity)
        img = try val.decodeIfPresent(String.self, forKey: .img)
        date = try val.decodeIfPresent(String.self, forKey: .date)
        average = try val.decodeIfPresent(Float.self, forKey: .average)
        count = try val.decodeIfPresent(Int.self, forKey: .count)
    }
    
}
