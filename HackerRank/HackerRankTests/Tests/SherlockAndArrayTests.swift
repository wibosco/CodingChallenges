// Created 07/07/2016.

import XCTest

@testable import HackerRank

final class SherlockAndArrayTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let array = [1, 2, 3]
        let possible = SherlockAndArray.leftRightEqualityPossible(array: array)
        
        XCTAssertFalse(possible)
    }
    
    func test_B() {
        let array = [1, 2, 3, 3]
        let possible = SherlockAndArray.leftRightEqualityPossible(array: array)
        
        XCTAssertTrue(possible)
    }
}
