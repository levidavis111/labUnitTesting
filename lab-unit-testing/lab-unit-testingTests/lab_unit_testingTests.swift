//
//  lab_unit_testingTests.swift
//  lab-unit-testingTests
//
//  Created by Levi Davis on 8/29/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import XCTest
@testable import lab_unit_testing

class lab_unit_testingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoadJokes() {
        let data = getJokeDataFromJSON()
        let joke = Joke.getJokes(from: data)
        XCTAssertTrue(joke != nil, "There is no Joke here")
    }
    
    func testJokesHasTenElements() {
        let data = getJokeDataFromJSON()
        let joke = Joke.getJokes(from: data)
        XCTAssertTrue(joke.count == 10, "There are not 10 elements; there are \(joke.count)")
    }
    
    func testPunchlineIsString() {
        let data = getJokeDataFromJSON()
        let joke = Joke.getJokes(from: data)
        XCTAssertTrue(joke[0].punchline == String(joke[0].punchline), "This is not a string")
    }

    private func getJokeDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "joke", ofType: "json") else {fatalError("Could not find path")}
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("Error: \(jsonError)")
        }
    }
}
