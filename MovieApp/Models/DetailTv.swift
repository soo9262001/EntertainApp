//
//  DetailTv.swift
//  MovieApp
//
//  Created by kms on 2021/08/18.
//

import Foundation

struct DetailTv: Codable {
    var id: Int
    var name: String?
    var date: String?
    var language: String?
    var popularity: Float?
    var img: String?
    var average: Float?
    var count: Int?
    var overview: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case date = "first_air_date"
        case language = "original_language"
        case popularity
        case img = "poster_path"
        case average = "vote_average"
        case count = "vote_count"
        case overview
    }
    
    init(from decoder: Decoder) throws {
        let val = try decoder.container(keyedBy: CodingKeys.self)
        id = try val.decode(Int.self, forKey: .id)
        name = try val.decodeIfPresent(String.self, forKey: .name)
        date = try val.decodeIfPresent(String.self, forKey: .date)
        language = try val.decodeIfPresent(String.self, forKey: .language)
        popularity = try val.decodeIfPresent(Float.self, forKey: .popularity)
        img = try val.decodeIfPresent(String.self, forKey: .img)
        average = try val.decodeIfPresent(Float.self, forKey: .average)
        count = try val.decodeIfPresent(Int.self, forKey: .count)
        overview = try val.decodeIfPresent(String.self, forKey: .overview)
    }
}
