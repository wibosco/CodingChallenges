// Created 09/11/2023.

import XCTest

@testable import LeetCode

final class CountNumberOfHomogenousSubstringsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "abbcccaa"
        
        let result = CountNumberOfHomogenousSubstrings().countHomogenous(s)
        
        XCTAssertEqual(result, 13)
    }
    
    func test_B() {
        let s = "xy"
        
        let result = CountNumberOfHomogenousSubstrings().countHomogenous(s)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let s = "zzzzz"
        
        let result = CountNumberOfHomogenousSubstrings().countHomogenous(s)
        
        XCTAssertEqual(result, 15)
    }
}
