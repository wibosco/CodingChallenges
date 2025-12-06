// Created 08/09/2024.


import XCTest

@testable import LeetCode

final class ValidTriangleNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2,2,3,4]
        
        let result = ValidTriangleNumber().triangleNumber(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let nums = [4,2,3,4]
        
        let result = ValidTriangleNumber().triangleNumber(nums)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let nums = [1,3,4]
        
        let result = ValidTriangleNumber().triangleNumber(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let nums = [0,1,1,1]
        
        let result = ValidTriangleNumber().triangleNumber(nums)
        
        XCTAssertEqual(result, 1)
    }
}
