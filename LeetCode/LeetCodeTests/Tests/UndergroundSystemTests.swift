//
//  UndergroundSystemTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 29/03/2022.
//

import XCTest

@testable import LeetCode

final class UndergroundSystemTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let undergroundSystem = UndergroundSystem()
        undergroundSystem.checkIn(45, "Leyton", 3)
        undergroundSystem.checkIn(32, "Paradise", 8)
        undergroundSystem.checkIn(27, "Leyton", 10)
        undergroundSystem.checkOut(45, "Waterloo", 15)
        undergroundSystem.checkOut(27, "Waterloo", 20)
        undergroundSystem.checkOut(32, "Cambridge", 22)
        
        XCTAssertEqual(undergroundSystem.getAverageTime("Paradise", "Cambridge"), 14.000, accuracy: 0.1)
        XCTAssertEqual(undergroundSystem.getAverageTime("Leyton", "Waterloo"), 11.000, accuracy: 0.1)
    }
}
