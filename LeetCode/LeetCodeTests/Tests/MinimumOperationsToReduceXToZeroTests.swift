// Created 05/11/2023.

import XCTest

@testable import LeetCode

final class MinimumOperationsToReduceXToZeroTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [1,1,4,2,3]
        let x = 5
        
        let result = MinimumOperationsToReduceXToZero().minOperations(nums, x)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [5,6,7,8,9]
        let x = 4
        
        let result = MinimumOperationsToReduceXToZero().minOperations(nums, x)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let nums = [3,2,20,1,1,3]
        let x = 10
        
        let result = MinimumOperationsToReduceXToZero().minOperations(nums, x)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_D() {
        let nums = [5]
        let x = 5
        
        let result = MinimumOperationsToReduceXToZero().minOperations(nums, x)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_E() {
        let nums = [1,10,1]
        let x = 22
        
        let result = MinimumOperationsToReduceXToZero().minOperations(nums, x)
        
        XCTAssertEqual(result, -1)
    }
}
