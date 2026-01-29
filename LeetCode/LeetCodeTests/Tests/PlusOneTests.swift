// Created 16/03/2022.

import XCTest

@testable import LeetCode

final class PlusOneTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let digits = [1, 2, 3]
        
        let result = PlusOne().plusOne(digits)
        
        XCTAssertEqual(result, [1, 2, 4])
    }
    
    func test_B() {
        let digits = [4, 3, 2, 1]
        
        let result = PlusOne().plusOne(digits)
        
        XCTAssertEqual(result, [4, 3, 2, 2])
    }
    
    func test_C() {
        let digits = [9]
        
        let result = PlusOne().plusOne(digits)
        
        XCTAssertEqual(result, [1, 0])
    }
}
