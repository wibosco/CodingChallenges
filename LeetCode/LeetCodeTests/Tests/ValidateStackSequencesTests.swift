// Created 28/07/2023.

import XCTest

@testable import LeetCode

final class ValidateStackSequencesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let pushed = [1, 2, 3, 4, 5]
        let popped = [4, 5, 3, 2, 1]
        
        let result = ValidateStackSequences().validateStackSequences(pushed, popped)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let pushed = [1, 2, 3, 4, 5]
        let popped = [4, 3, 5, 1, 2]
        
        let result = ValidateStackSequences().validateStackSequences(pushed, popped)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let pushed = [2, 1, 0]
        let popped = [1, 2, 0]
        
        let result = ValidateStackSequences().validateStackSequences(pushed, popped)
        
        XCTAssertTrue(result)
    }
}
