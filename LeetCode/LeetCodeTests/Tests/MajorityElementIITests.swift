// Created 21/02/2022.

import XCTest

@testable import LeetCode

final class MajorityElementIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 2, 3]
        
        let result = MajorityElementII().majorityElement(nums)
        
        XCTAssertEqual(result, [3])
    }
    
    func test_B() {
        let nums = [1]
        
        let result = MajorityElementII().majorityElement(nums)
        
        XCTAssertEqual(result, [1])
    }
    
    func test_C() {
        let nums = [1, 2]
        
        let result = MajorityElementII().majorityElement(nums)
        
        XCTAssertEqual(result, [1, 2])
    }
}
