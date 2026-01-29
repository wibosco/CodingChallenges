// Created 22/01/2022.

import XCTest

@testable import LeetCode

final class NRepeatedElementInSize2NArrayTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 3]
        
        let result = NRepeatedElementInSize2NArray().repeatedNTimes(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let nums = [2, 1, 2, 5, 3, 2]
        
        let result = NRepeatedElementInSize2NArray().repeatedNTimes(nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let nums = [5, 1, 5, 2, 5, 3, 5, 4]
        
        let result = NRepeatedElementInSize2NArray().repeatedNTimes(nums)
        
        XCTAssertEqual(result, 5)
    }
}
