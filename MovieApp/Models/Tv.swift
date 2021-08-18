//
//  Tv.swift
//  MovieApp
//
//  Created by kms on 2021/08/18.
//

import Foundation

struct Tv: Codable {
    var id: Int
    var name: String?
    var date: String?
    var country: String?
    var language: String?
    var popularity: Float?
    var img: String?
    var average: Float?
    var count: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case date = "first_air_date"
        case country = "origin_country"
        case language = "original_language"
        case popularity
        case img = "poster_path"
        case average = "vote_average"
        case count = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let val = try decoder.container(keyedBy: CodingKeys.self)
        id = try val.decode(Int.self, forKey: .id)
        name = try val.decodeIfPresent(String.self, forKey: .name)
        date = try val.decodeIfPresent(String.self, forKey: .date)
        country = try val.decodeIfPresent(String.self, forKey: .country)
        language = try val.decodeIfPresent(String.self, forKey: .language)
        popularity = try val.decodeIfPresent(Float.self, forKey: .popularity)
        img = try val.decodeIfPresent(String.self, forKey: .img)
        average = try val.decodeIfPresent(Float.self, forKey: .average)
        count = try val.decodeIfPresent(Int.self, forKey: .count)
    }
}
