// Created 18/11/2021.

import XCTest

@testable import LeetCode

final class FirstBadVersionTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let n = 5
        let bad = 4
        
        let sut = FirstBadVersion(badVersion: bad)
        let result = sut.firstBadVersion(n)
        
        XCTAssertEqual(result, bad)
    }
    
    func test_B() {
        let n = 1
        let bad = 1
        
        let sut = FirstBadVersion(badVersion: bad)
        let result = sut.firstBadVersion(n)
        
        XCTAssertEqual(result, bad)
    }
}
