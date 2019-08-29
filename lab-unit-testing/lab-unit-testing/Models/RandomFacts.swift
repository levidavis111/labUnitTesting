//
//  RandomFacts.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

struct Results: Codable {
    let results: [Fact]
    
    static func getFacts(from data: Data) -> [Fact] {
        do {
            let results = try JSONDecoder().decode(Results.self, from: data)
            return results.results
        } catch let decodeError {
            fatalError("Error: \(decodeError)")
        }
    }
}

struct Fact: Codable {
    let question: String
}
