// Created 12/09/2024.

import XCTest

@testable import LeetCode

final class KthSmallestPrimeFractionTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let arr = [1,2,3,5]
        let k = 3
        
        let result = KthSmallestPrimeFraction().kthSmallestPrimeFraction(arr, k)
        
        XCTAssertEqual(result, [2,5])
    }
    
    func test_B() {
        let arr = [1,7]
        let k = 1
        
        let result = KthSmallestPrimeFraction().kthSmallestPrimeFraction(arr, k)
        
        XCTAssertEqual(result, [1,7])
    }
}
