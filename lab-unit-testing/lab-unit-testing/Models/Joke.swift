//
//  Joke.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

struct Joke: Codable {
    let setup: String
    let punchline: String
    
    static func loadData(from data: Data) throws -> [Joke] {
        
        do {
            let results = try JSONDecoder().decode([Joke].self, from: data)
            return results
        } catch let decodeError {
            fatalError("Error: \(decodeError)")
        }
    }
    
}
