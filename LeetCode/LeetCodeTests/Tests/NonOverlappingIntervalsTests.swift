//
//  NonOverlappingIntervalsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 06/07/2023.
//

import XCTest

@testable import LeetCode

final class NonOverlappingIntervalsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let intervals = [[1, 2], [2, 3], [3, 4], [1, 3]]
        
        let result = NonOverlappingIntervals.eraseOverlapIntervals(intervals)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let intervals = [[1, 2], [1, 2], [1, 2]]
        
        let result = NonOverlappingIntervals.eraseOverlapIntervals(intervals)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let intervals = [[1, 2], [2, 3]]
        
        let result = NonOverlappingIntervals.eraseOverlapIntervals(intervals)
        
        XCTAssertEqual(result, 0)
    }
}
