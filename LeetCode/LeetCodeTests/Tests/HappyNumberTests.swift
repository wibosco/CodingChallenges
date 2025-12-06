// Created 20/01/2022.


import XCTest

@testable import LeetCode

final class HappyNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 19
        
        let result = HappyNumber().isHappy(n)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let n = 2
        
        let result = HappyNumber().isHappy(n)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let n = 1
        
        let result = HappyNumber().isHappy(n)
        
        XCTAssertTrue(result)
    }
}
