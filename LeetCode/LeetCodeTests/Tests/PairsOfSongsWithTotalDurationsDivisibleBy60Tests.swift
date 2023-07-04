//
//  PairsOfSongsWithTotalDurationsDivisibleBy60Tests.swift
//  LeetCodeTests
//
//  Created by William Boles on 22/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class PairsOfSongsWithTotalDurationsDivisibleBy60Tests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let time = [30, 20, 150, 100, 40]
        
        let result = PairsOfSongsWithTotalDurationsDivisibleBy60.numPairsDivisibleBy60(time)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let time = [60, 60, 60]
        
        let result = PairsOfSongsWithTotalDurationsDivisibleBy60.numPairsDivisibleBy60(time)
        
        XCTAssertEqual(result, 3)
    }
}
