// Created 05/06/2024.


import XCTest

@testable import LeetCode

final class DIStringMatchTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "IDID"
        
        let result = DIStringMatch().diStringMatch(s)
        
        XCTAssertEqual(result, [0,4,1,3,2])
    }
    
    func test_B() {
        let s = "III"
        
        let result = DIStringMatch().diStringMatch(s)
        
        XCTAssertEqual(result, [0,1,2,3])
    }
    
    func test_C() {
        let s = "DDI"
        
        let result = DIStringMatch().diStringMatch(s)
        
        XCTAssertEqual(result, [3,2,0,1])
    }
}
