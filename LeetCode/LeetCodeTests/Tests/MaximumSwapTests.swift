// Created 03/01/2022.

import XCTest

@testable import LeetCode

final class MaximumSwapTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num = 2736
        
        let result = MaximumSwap().maximumSwap(num)
        
        XCTAssertEqual(result, 7236)
    }
    
    func test_B() {
        let num = 9973
        
        let result = MaximumSwap().maximumSwap(num)
        
        XCTAssertEqual(result, 9973)
    }
    
    func test_C() {
        let num = 98368

        let result = MaximumSwap().maximumSwap(num)
        
        XCTAssertEqual(result, 98863)
    }
}
