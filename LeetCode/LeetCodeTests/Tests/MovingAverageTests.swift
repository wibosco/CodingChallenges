//
//  MovingAverageTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/02/2022.
//

import XCTest

@testable import LeetCode

final class MovingAverageTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let sut = MovingAverage(3)
        XCTAssertEqual(sut.next(1), 1.0, accuracy: 0.1)
        XCTAssertEqual(sut.next(10), 5.5, accuracy: 0.1)
        XCTAssertEqual(sut.next(3), 4.6, accuracy: 0.1)
        XCTAssertEqual(sut.next(5), 6.0, accuracy: 0.1)
    }
}
