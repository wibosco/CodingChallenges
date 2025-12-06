// Created 30/08/2024.


import XCTest

@testable import LeetCode

final class NumberOfDistinctAveragesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [4,1,4,0,3,5]
        
        let result = NumberOfDistinctAverages().distinctAverages(nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [1,100]
        
        let result = NumberOfDistinctAverages().distinctAverages(nums)
        
        XCTAssertEqual(result, 1)
    }
}
