// Created 22/11/2023.


import XCTest

@testable import LeetCode

final class PathSumIVTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [113,215,221]
        
        let result = PathSumIV().pathSum(nums)
        
        XCTAssertEqual(result, 12)
    }
    
    func test_B() {
        let nums = [113,221]
        
        let result = PathSumIV().pathSum(nums)
        
        XCTAssertEqual(result, 4)
    }
}
