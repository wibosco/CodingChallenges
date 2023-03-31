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
        let undergrounsSystem = UndergroundSystem()
        undergrounsSystem.checkIn(45, "Leyton", 3)
        undergrounsSystem.checkIn(32, "Paradise", 8)
        undergrounsSystem.checkIn(27, "Leyton", 10)
        undergrounsSystem.checkOut(45, "Waterloo", 15)
        undergrounsSystem.checkOut(27, "Waterloo", 20)
        undergrounsSystem.checkOut(32, "Cambridge", 22)
        
        XCTAssertEqual(undergrounsSystem.getAverageTime("Paradise", "Cambridge"), 14.000, accuracy: 0.1)
        XCTAssertEqual(undergrounsSystem.getAverageTime("Leyton", "Waterloo"), 11.000, accuracy: 0.1)
    }
}
