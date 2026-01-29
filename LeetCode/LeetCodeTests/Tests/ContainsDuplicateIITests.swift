// Created 31/03/2022.

import XCTest

@testable import LeetCode

final class ContainsDuplicateIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 1]
        let k = 3
        
        let result = ContainsDuplicateII().containsNearbyDuplicate(nums, k)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let nums = [1, 0, 1, 1]
        let k = 1
        
        let result = ContainsDuplicateII().containsNearbyDuplicate(nums, k)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let nums = [1, 2, 3, 1, 2, 3]
        let k = 2
        
        let result = ContainsDuplicateII().containsNearbyDuplicate(nums, k)
        
        XCTAssertFalse(result)
    }
}
