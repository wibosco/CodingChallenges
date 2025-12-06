// Created 17/07/2023.


import XCTest

@testable import LeetCode

final class RotateArrayTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        var nums = [1, 2, 3, 4, 5, 6, 7]
        let k = 3
        
        RotateArray().rotate(&nums, k)
        
        XCTAssertEqual(nums, [5, 6, 7, 1, 2, 3, 4])
    }
    
    func test_B() {
        var nums = [-1, -100, 3, 99]
        let k = 2
        
        RotateArray().rotate(&nums, k)
        
        XCTAssertEqual(nums, [3, 99, -1, -100])
    }
    
    func test_C() {
        var nums = [-1]
        let k = 2
        
        RotateArray().rotate(&nums, k)
        
        XCTAssertEqual(nums, [-1])
    }
    
    func test_D() {
        var nums = [1, 2, 3]
        let k = 8
        
        RotateArray().rotate(&nums, k)
        
        XCTAssertEqual(nums, [2, 3, 1])
    }
}
