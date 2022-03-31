//
//  ProductOfArrayExceptSelfTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/03/2022.
//

import XCTest

@testable import LeetCode

class ProductOfArrayExceptSelfTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 4]
        
        let product = ProductOfArrayExceptSelf.productExceptSelf(nums)
        
        XCTAssertEqual(product, [24, 12, 8, 6])
    }
    
    func test_B() {
        let nums = [-1, 1, 0, -3, 3]
        
        let product = ProductOfArrayExceptSelf.productExceptSelf(nums)
        
        XCTAssertEqual(product, [0, 0, 9, 0, 0])
    }
}
