// Created 14/07/2023.


import XCTest

@testable import LeetCode

final class SignOfTheProductOfAnArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-1, -2, -3, -4, 3, 2, 1]
        
        let result = SignOfTheProductOfAnArray().arraySign(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let nums = [1, 5, 0, 2, -3]
        
        let result = SignOfTheProductOfAnArray().arraySign(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let nums = [-1, 1, -1, 1, -1]
        
        let result = SignOfTheProductOfAnArray().arraySign(nums)
        
        XCTAssertEqual(result, -1)
    }

}
