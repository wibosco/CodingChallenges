// Created 14/11/2021.


import XCTest

@testable import LeetCode

final class NextPermutationTests: XCTestCase {

   // MARK: - Tests
    
    func test_A() {
        var nums = [1, 2, 3]
        
        NextPermutation().nextPermutation(&nums)
        
        XCTAssertEqual(nums, [1, 3, 2])
    }
    
    func test_B() {
        var nums = [3, 2, 1]
        
        NextPermutation().nextPermutation(&nums)
        
        XCTAssertEqual(nums, [1, 2, 3])
    }
    
    func test_C() {
        var nums = [1]
        
        NextPermutation().nextPermutation(&nums)
        
        XCTAssertEqual(nums, [1])
    }
    
    func test_D() {
        var nums = [1, 3, 2]
        
        NextPermutation().nextPermutation(&nums)
        
        XCTAssertEqual(nums, [2, 1, 3])
    }
}
