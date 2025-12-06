// Created 29/02/2024.


import XCTest

@testable import LeetCode

final class SpecialArrayWithXElementsGreaterThanOrEqualXTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3,5]
        
        let result = SpecialArrayWithXElementsGreaterThanOrEqualX().specialArray(nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [0,0]
        
        let result = SpecialArrayWithXElementsGreaterThanOrEqualX().specialArray(nums)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let nums = [0,4,3,0,4]
        
        let result = SpecialArrayWithXElementsGreaterThanOrEqualX().specialArray(nums)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_D() {
        let nums = [1,0,0,6,4,9]
        
        let result = SpecialArrayWithXElementsGreaterThanOrEqualX().specialArray(nums)
        
        XCTAssertEqual(result, 3)
    }
}
