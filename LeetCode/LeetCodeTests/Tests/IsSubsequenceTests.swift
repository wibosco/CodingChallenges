// Created 07/07/2023.


import XCTest

@testable import LeetCode

final class IsSubsequenceTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "abc"
        let t = "ahbgdc"
        
        let result = IsSubsequence().isSubsequence(s, t)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "axc"
        let t = "ahbgdc"
        
        let result = IsSubsequence().isSubsequence(s, t)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let s = "abc"
        let t = "ahbgdcz"
        
        let result = IsSubsequence().isSubsequence(s, t)
        
        XCTAssertTrue(result)
    }
}
