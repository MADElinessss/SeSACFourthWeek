//
//  Movie.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/15/24.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String
    let runtime: Int
    let overview: String
    let rate: Double
    let thumbnail: String
    let backdrop: [String]
    
    var description: String {
        return "\(title) | \(rate)점 | \(runtime)분"
    }
}
