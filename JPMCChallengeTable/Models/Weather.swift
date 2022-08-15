//
//  Weather.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/11/22.
//

import Foundation

//struct Weather: Codable {
//    let dataseries: [Dataseries]
//}
//
//struct Dataseries: Codable {
//    let timepoint: Int
//    let cloudCover: Int
//    let transparency: Int
//    let wind10m: WindDirection
//}
//
//struct WindDirection: Codable {
//    let direction: String?
//}

//struct Weather: Codable {
//    struct Dataseries: Codable {
//        let timepoint: Int
//        let cloudCover: Int
//        let transparency: Int
//
//        struct Wind10m: Codable {
//            let direction: String?
//        }
//
//        let wind10m: Wind10m
//    }
//
//    let dataseries: [Dataseries]
//}

struct WeatherModel : Codable {
    let product : String
    let dataseries: [Dataseries]?
}

struct Dataseries:Codable {
    let timepoint : String
    let cloudCover: Int
    let transparency: Int
    let wind10m: Wind10m

}

struct Wind10m:Codable{
    let direction : String
    let speed : String
}
