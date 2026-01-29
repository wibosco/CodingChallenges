// Created 17/01/2022.

import XCTest

@testable import LeetCode

final class MinimumNumberOfSwapsToMakeTheStringBalancedTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "][]["
        
        let result = MinimumNumberOfSwapsToMakeTheStringBalanced().minSwaps(s)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let s = "]]][[["
        
        let result = MinimumNumberOfSwapsToMakeTheStringBalanced().minSwaps(s)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let s = "[]"
        
        let result = MinimumNumberOfSwapsToMakeTheStringBalanced().minSwaps(s)
        
        XCTAssertEqual(result, 0)
    }
}
