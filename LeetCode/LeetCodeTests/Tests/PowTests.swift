// Created 15/11/2021.

import XCTest

@testable import LeetCode

final class PowTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let x = 2.00000
        let n = 10
        
        let result = Pow().myPow(x, n)
        
        XCTAssertEqual(result, 1024.0, accuracy: 0.001)
    }
    
    func test_B() {
        let x = 2.10000
        let n = 3
        
        let result = Pow().myPow(x, n)
        
        XCTAssertEqual(result, 9.26100, accuracy: 0.001)
    }
    
    func test_C() {
        let x = 2.00000
        let n = -2
        
        let result = Pow().myPow(x, n)
        
        XCTAssertEqual(result, 0.25000, accuracy: 0.001)
    }
    
    func test_D() {
        let x = 1.00000
        let n = -2147483648
        
        let result = Pow().myPow(x, n)
        
        XCTAssertEqual(result, 1, accuracy: 0.001)
    }
}
