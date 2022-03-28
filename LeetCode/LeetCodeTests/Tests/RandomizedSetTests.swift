//
//  RandomizedSetTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/03/2022.
//

import XCTest

@testable import LeetCode

class RandomizedSetTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let set = RandomizedSet()
        XCTAssertTrue(set.insert(0))
        XCTAssertTrue(set.insert(1))
        XCTAssertTrue(set.remove(0))
        XCTAssertFalse(set.remove(0))
        XCTAssertTrue(set.insert(2))
        XCTAssertFalse(set.insert(1))
        XCTAssertTrue(set.remove(1))
        XCTAssertEqual(set.getRandom(), 2)
    }
}
