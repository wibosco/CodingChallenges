//
//  RemoveCoveredIntervalsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/11/2023.
//

import XCTest

@testable import LeetCode

final class RemoveCoveredIntervalsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let intervals = [[1,4],
                         [3,6],
                         [2,8]]
        
        let result = RemoveCoveredIntervals.removeCoveredIntervals(intervals)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let intervals = [[1,4],
                         [2,3]]
        
        let result = RemoveCoveredIntervals.removeCoveredIntervals(intervals)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let intervals = [[1,2],
                         [1,4],
                         [3,4]]
        
        let result = RemoveCoveredIntervals.removeCoveredIntervals(intervals)
        
        XCTAssertEqual(result, 1)
    }
}
