// Created 15/11/2021.

import XCTest

@testable import LeetCode

final class MergeIntervalsTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let intervals = [[1,3],[2,6],[8,10],[15,18]]
        
        let result = MergeIntervals().merge(intervals)
        
        XCTAssertEqual(result,[[1,6],[8,10],[15,18]])
    }
    
    func test_B() {
        let intervals = [[1,4],[4,5]]
        
        let result = MergeIntervals().merge(intervals)
        
        XCTAssertEqual(result,[[1,5]])
    }
    
    func test_C() {
        let intervals = [[1,4],[0,4]]
        
        let result = MergeIntervals().merge(intervals)
        
        XCTAssertEqual(result,[[0,4]])
    }
    
    func test_D() {
        let intervals = [[4,5],[1,4],[0,1]]
        
        let result = MergeIntervals().merge(intervals)
        
        XCTAssertEqual(result,[[0,5]])
    }
    
    func test_E() {
        let intervals = [[2,3],[4,5],[6,7],[8,9],[1,10]]
        
        let result = MergeIntervals().merge(intervals)
        
        XCTAssertEqual(result,[[1,10]])
    }
    
    func test_F() {
        let intervals = [[1,4],[2,3]]
        
        let result = MergeIntervals().merge(intervals)
        
        XCTAssertEqual(result,[[1,4]])
    }
}
