// Created 27/02/2024.

import XCTest

@testable import LeetCode

final class CountTheNumberOfIncremovableSubarraysITests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1,2,3,4]
        
        let result = CountTheNumberOfIncremovableSubarraysI().incremovableSubarrayCount(nums)
        
        XCTAssertEqual(result, 10)
    }
    
    func test_B() {
        let nums = [6,5,7,8]
        
        let result = CountTheNumberOfIncremovableSubarraysI().incremovableSubarrayCount(nums)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_C() {
        let nums = [8,7,6,6]
        
        let result = CountTheNumberOfIncremovableSubarraysI().incremovableSubarrayCount(nums)
        
        XCTAssertEqual(result, 3)
    }
}
