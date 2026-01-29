// Created 14/07/2023.

import XCTest

@testable import LeetCode

final class NonDecreasingArrayTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [4, 2, 3]
        
        let result = NonDecreasingArray().checkPossibility(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let nums = [4, 2, 1]
        
        let result = NonDecreasingArray().checkPossibility(nums)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let nums = [3, 4, 2]
        
        let result = NonDecreasingArray().checkPossibility(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let nums = [3, 4, 2, 3]
        
        let result = NonDecreasingArray().checkPossibility(nums)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let nums = [3, 7, 5]
        
        let result = NonDecreasingArray().checkPossibility(nums)
        
        XCTAssertTrue(result)
    }
    
    func test_F() {
        let nums = [3, 7, 5, 3]
        
        let result = NonDecreasingArray().checkPossibility(nums)
        
        XCTAssertFalse(result)
    }
}
