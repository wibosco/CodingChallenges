//
//  TheatreGuestsTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 18/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class TheatreGuestsTests: XCTestCase {

    // MARK: Tests
    
    func test_sortA() {
        var guestsInSeats = ["A", "B", "C", "D", "A", "B", "C", "D"]
        let expectedGuestsInSeats = ["A", "A", "C", "C", "B", "B", "D", "D"]
        
         TheatreGuests.sortGuestsInSeats(&guestsInSeats)
        
        XCTAssertEqual(guestsInSeats, expectedGuestsInSeats)
    }
    
    // MARK: Alt
    
    func test_sortAltA() {
        var guestsInSeats = ["A", "B", "C", "D", "A", "B", "C", "D"]
        let expectedGuestsInSeats = ["A", "A", "D", "D", "B", "B", "C", "C"]
        
        TheatreGuests.sortGuestsInSeatsAlt(&guestsInSeats)
        
        XCTAssertEqual(guestsInSeats, expectedGuestsInSeats)
    }
    
    func test_sortAltB() {
        var guestsInSeats = ["A", "B", "D", "C", "D", "B", "C", "A"]
        let expectedGuestsInSeats = ["A", "A", "D", "D", "C", "C", "B", "B"]
        
        TheatreGuests.sortGuestsInSeatsAlt(&guestsInSeats)
        
        XCTAssertEqual(guestsInSeats, expectedGuestsInSeats)
    }
    
    func test_sortAltC() {
        var guestsInSeats = ["A", "B", "E", "D", "D", "B", "C", "A", "E", "C"]
        let expectedGuestsInSeats = ["A", "A", "E", "E", "C", "C", "B", "B", "D", "D"]
        
        TheatreGuests.sortGuestsInSeatsAlt(&guestsInSeats)
        
        XCTAssertEqual(guestsInSeats, expectedGuestsInSeats)
    }
}
