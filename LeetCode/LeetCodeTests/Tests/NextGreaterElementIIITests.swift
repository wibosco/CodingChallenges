// Created 05/09/2024.

import XCTest

@testable import LeetCode

final class NextGreaterElementIIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 12
        
        let result = NextGreaterElementIII().nextGreaterElement(n)
        
        XCTAssertEqual(result, 21)
    }
    
    func test_B() {
        let n = 21
        
        let result = NextGreaterElementIII().nextGreaterElement(n)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let n = 2147483486
        
        let result = NextGreaterElementIII().nextGreaterElement(n)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_D() {
        let n = 2147483476
        
        let result = NextGreaterElementIII().nextGreaterElement(n)
        
        XCTAssertEqual(result, 2147483647)
    }
}
