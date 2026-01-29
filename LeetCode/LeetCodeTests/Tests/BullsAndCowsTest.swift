// Created 01/04/2023.

import XCTest

@testable import LeetCode

final class BullsAndCowsTest: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let secret = "1807"
        let guess = "7810"
        
        let result = BullsAndCows().getHint(secret, guess)
        
        XCTAssertEqual(result, "1A3B")
    }
    
    func test_B() {
        let secret = "1123"
        let guess = "0111"
        
        let result = BullsAndCows().getHint(secret, guess)
        
        XCTAssertEqual(result, "1A1B")
    }
}
