//
//  Weather.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/11/22.
//

import Foundation

struct Weather: Codable {
    let dataseries: [Dataseries]
}

struct Dataseries: Codable {
    let timepoint: Int
    let cloudCover: Int
    let transparency: Int
    let wind10m: [WindDirection]
}

struct WindDirection: Codable {
    let direction: String
}
