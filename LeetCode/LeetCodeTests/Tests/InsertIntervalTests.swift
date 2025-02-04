//
//  InsertIntervalTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/03/2022.
//

import XCTest

@testable import LeetCode

final class InsertIntervalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let intervals = [[1, 3], [6, 9]]
        let newInterval = [2, 5]
        
        let result = InsertInterval().insert(intervals, newInterval)
        
        XCTAssertEqual(result, [[1, 5], [6, 9]])
    }
    
    func test_B() {
        let intervals = [[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]]
        let newInterval = [4, 8]
        
        let result = InsertInterval().insert(intervals, newInterval)
        
        XCTAssertEqual(result, [[1, 2], [3, 10], [12, 16]])
    }
}
