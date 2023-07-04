//
//  FirstBadVersionTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

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
