// Created 20/11/2021.


import XCTest

@testable import LeetCode

final class TwoSumIITests: XCTestCase {
    
    // MARK: - Test
    
    func test_A() {
        let numbers = [2, 7, 11, 15]
        let target = 9
        
        let result = TwoSumII().twoSum(numbers, target)
        
        XCTAssertEqual(result, [1, 2]) //indexing is from 1
    }
    
    func test_B() {
        let numbers = [2, 3, 4]
        let target = 6
        
        let result = TwoSumII().twoSum(numbers, target)
        
        XCTAssertEqual(result, [1, 3]) //indexing is from 1
    }
    
    func test_C() {
        let numbers = [-1, 0]
        let target = -1
        
        let result = TwoSumII().twoSum(numbers, target)
        
        XCTAssertEqual(result, [1, 2]) //indexing is from 1
    }
    
    func test_D() {
        let numbers = [1, 2, 3, 4, 4, 9, 56, 90]
        let target = 8
        
        let result = TwoSumII().twoSum(numbers, target)
        
        XCTAssertEqual(result, [4, 5]) //indexing is from 1
    }
    
    func test_E() {
        let numbers = [2, 7, 11, 15]
        let target = 9
        
        let result = TwoSumII().twoSum(numbers, target)
        
        XCTAssertEqual(result, [1, 2]) //indexing is from 1
    }
}
