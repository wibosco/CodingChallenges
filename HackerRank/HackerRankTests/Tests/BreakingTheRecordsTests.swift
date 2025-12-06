// Created 28/10/2021.


import XCTest

@testable import HackerRank

final class BreakingTheRecordsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let scores = [10, 5, 20, 20, 4, 5, 2, 25, 1]
        
        let breakingRecordCounts = BreakingTheRecords.breakingRecords(scores: scores)
        
        XCTAssertEqual(breakingRecordCounts.max, 2)
        XCTAssertEqual(breakingRecordCounts.min, 4)
    }
    
    func test_B() {
        let scores = [3, 4, 21, 36, 10, 28, 35, 5, 24, 42]
        
        let breakingRecordCounts = BreakingTheRecords.breakingRecords(scores: scores)
        
        XCTAssertEqual(breakingRecordCounts.max, 4)
        XCTAssertEqual(breakingRecordCounts.min, 0)
    }
}
