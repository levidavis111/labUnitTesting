//
//  StarWars.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

struct StarWars: Codable {
    let results: [Movie]
    
}

struct Movie: Codable {
    let title: String
    
    static func getMovies(from data: Data) -> [Movie] {
        do {
            let results = try JSONDecoder().decode(StarWars.self, from: data)
            return results.results
        } catch let decodeError {
            fatalError("Error: \(decodeError)")
        }
    }
}
