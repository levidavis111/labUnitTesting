//
//  RandomFacts.swift
//  lab-unit-testing
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

struct ArrayOfFacts: Codable {
    let results: [Fact]
    
    static func getFacts(from data: Data) -> [Fact] {
        do {
            let results = try JSONDecoder().decode(ArrayOfFacts.self, from: data)
            return results.results
        } catch let decodeError {
            fatalError("Error: \(decodeError)")
        }
    }
}

struct Fact: Codable {
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    
    func allAnswerArray() -> [String] {
        var answerArray = self.incorrect_answers
        answerArray.insert(self.correct_answer, at: Int.random(in: 0...self.incorrect_answers.count))
        return answerArray
    }
}
