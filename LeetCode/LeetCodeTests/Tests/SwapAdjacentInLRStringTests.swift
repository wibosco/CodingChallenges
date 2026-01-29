// Created 10/09/2024.

import XCTest

@testable import LeetCode

final class SwapAdjacentInLRStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let start = "RXXLRXRXL"
        let end = "XRLXXRRLX"
        
        let result = SwapAdjacentInLRString().canTransform(start, end)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let start = "X"
        let end = "L"
        
        let result = SwapAdjacentInLRString().canTransform(start, end)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let start = "XXXXXLXXXX"
        let end = "LXXXXXXXXX"
        
        let result = SwapAdjacentInLRString().canTransform(start, end)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let start = "LXXLXRLXXL"
        let end = "XLLXRXLXLX"
        
        let result = SwapAdjacentInLRString().canTransform(start, end)
        
        XCTAssertFalse(result)
    }
}
