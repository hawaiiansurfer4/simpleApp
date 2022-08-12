//
//  Webservice.swift
//  JPMCChallengeTable
//
//  Created by Sean Murphy on 8/11/22.
//

import Foundation

//enum NetworkError: Error {
//    case networkError
//    case failedToParse
//    
//}
//
//class Webservice(completion: @escaping (Results<Weather,NetworkError> -> Void) {
//    guard let url = URL(string: "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0") else {
//        completion(.failure(NetworkError.networkError))
//    }
//    
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        guard let data = data, error == nil else {
//            self.completion(.failure(error))
//            return
//        }
//        
//        do {
//            
//        } catch {
//            self.completion(.failure(NetworkError.failedToParse))
//        }
//
//    }
//}
