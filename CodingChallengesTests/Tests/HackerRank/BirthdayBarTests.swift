//
//  BirthdayBarTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 28/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class BirthdayBarTests: XCTestCase {
    // MARK: - Tests
    
    func test_A() {
        let segments = [2, 2, 1, 3, 2]
        let day = 4
        let month = 2
        
        let found = BirthdayBar.birthday(s: segments, d: day, m: month)
        
        XCTAssertEqual(found, 2)
    }
    
    func test_B() {
        let segments = [1, 1, 1, 1, 1, 1]
        let day = 3
        let month = 2
        
        let found = BirthdayBar.birthday(s: segments, d: day, m: month)
        
        XCTAssertEqual(found, 0)
    }
    
    func test_C() {
        let segments = [4]
        let day = 4
        let month = 1
        
        let found = BirthdayBar.birthday(s: segments, d: day, m: month)
        
        XCTAssertEqual(found, 1)
    }
}
