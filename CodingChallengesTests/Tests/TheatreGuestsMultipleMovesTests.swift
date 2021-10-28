//
//  TheatreGuestsMultipleMovesTests.swift
//  CodingChallenges
//
//  Created by William Boles on 18/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class TheatreGuestsMultipleMovesTests: XCTestCase {

    // MARK: Tests
    
    func test_sortA() {
        var guestsInSeats = ["A", "B", "C", "D", "A", "B", "C", "D"]
        let expectedGuestsInSeats = ["A", "A", "C", "C", "B", "B", "D", "D"]
        
        TheatreGuestsMultipleMoves.sort(guestsInSeats: &guestsInSeats)
        
        XCTAssertEqual(guestsInSeats, expectedGuestsInSeats)
    }
    
    func test_sortB() {
        var guestsInSeats = ["A", "B", "D", "C", "D", "B", "C", "A"]
        let expectedGuestsInSeats = ["A", "A", "D", "D", "C", "C", "B", "B"]
        
        TheatreGuestsMultipleMoves.sort(guestsInSeats: &guestsInSeats)
        
        XCTAssertEqual(guestsInSeats, expectedGuestsInSeats)
    }
    
    func test_sortC() {
        var guestsInSeats = ["A", "B", "E", "D", "D", "B", "C", "A", "E", "C"]
        let expectedGuestsInSeats = ["A", "A", "E", "E", "D", "D", "C", "C", "B", "B"]
        
        TheatreGuestsMultipleMoves.sort(guestsInSeats: &guestsInSeats)
        
        XCTAssertEqual(guestsInSeats, expectedGuestsInSeats)
    }
}
