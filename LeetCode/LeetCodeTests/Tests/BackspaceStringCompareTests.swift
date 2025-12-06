// Created 02/09/2024.


import XCTest

@testable import LeetCode

final class BackspaceStringCompareTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "ab#c"
        let t = "ad#c"
            
        let result = BackspaceStringCompare().backspaceCompare(s, t)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let s = "ab##"
        let t = "c#d#"
            
        let result = BackspaceStringCompare().backspaceCompare(s, t)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let s = "a#c"
        let t = "b"
            
        let result = BackspaceStringCompare().backspaceCompare(s, t)
        
        XCTAssertFalse(result)
    }
}
