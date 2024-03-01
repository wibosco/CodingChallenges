//
//  KthMissingPositiveNumberTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/03/2024.
//

import XCTest

@testable import LeetCode

final class KthMissingPositiveNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let arr = [2,3,4,7,11]
        let k = 5
        
        let result = KthMissingPositiveNumber().findKthPositive(arr, k)
        
        XCTAssertEqual(result, 9)
    }
    
    func test_B() {
        let arr = [1,2,3,4]
        let k = 2
        
        let result = KthMissingPositiveNumber().findKthPositive(arr, k)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_C() {
        let arr = [3,4,7,11]
        let k = 5
        
        let result = KthMissingPositiveNumber().findKthPositive(arr, k)
        
        XCTAssertEqual(result, 8)
    }
    
    func test_D() {
        let arr = [11]
        let k = 5
        
        let result = KthMissingPositiveNumber().findKthPositive(arr, k)
        
        XCTAssertEqual(result, 5)
    }
}
