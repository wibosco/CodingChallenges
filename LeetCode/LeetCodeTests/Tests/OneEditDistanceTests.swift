// Created 03/09/2024.

import XCTest

@testable import LeetCode

final class OneEditDistanceTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "ab"
        let t = "acb"
            
        let result = OneEditDistance().isOneEditDistance(s, t)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = ""
        let t = ""
            
        let result = OneEditDistance().isOneEditDistance(s, t)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let s = "c"
        let t = "c"
            
        let result = OneEditDistance().isOneEditDistance(s, t)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let s = "a"
        let t = ""
            
        let result = OneEditDistance().isOneEditDistance(s, t)
        
        XCTAssertTrue(result)
    }
}
