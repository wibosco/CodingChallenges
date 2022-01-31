//
//  MergeIntervalsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class MergeIntervalsTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let intervals = [[1, 3], [2, 6], [8, 10], [15, 18]]
        
        let merged = MergeIntervals.merge(intervals)
        
        XCTAssertEqual(merged, [[1, 6],[8, 10],[15, 18]])
    }
    
    func test_B() {
        let intervals = [[1, 4], [4, 5]]
        
        let merged = MergeIntervals.merge(intervals)
        
        XCTAssertEqual(merged, [[1, 5]])
    }
    
    func test_C() {
        let intervals = [[1, 4], [0, 4]]
        
        let merged = MergeIntervals.merge(intervals)
        
        XCTAssertEqual(merged, [[0, 4]])
    }
    
    func test_D() {
        let intervals = [[4, 5], [1, 4], [0, 1]]
        
        let merged = MergeIntervals.merge(intervals)
        
        XCTAssertEqual(merged, [[0, 5]])
    }
    
    func test_E() {
        let intervals = [[2, 3], [4, 5], [6, 7], [8, 9], [1, 10]]
        
        let merged = MergeIntervals.merge(intervals)
        
        XCTAssertEqual(merged, [[1, 10]])
    }
}
