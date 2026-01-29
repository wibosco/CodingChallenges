// Created 11/06/2024.

import XCTest

@testable import LeetCode

final class FindTheArrayConcatenationValueTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [7,52,2,4]
        
        let result = FindTheArrayConcatenationValue().findTheArrayConcVal(nums)
        
        XCTAssertEqual(result, 596)
    }
    
    func test_B() {
        let nums = [5,14,13,8,12]
        
        let result = FindTheArrayConcatenationValue().findTheArrayConcVal(nums)
        
        XCTAssertEqual(result, 673)
    }
}
