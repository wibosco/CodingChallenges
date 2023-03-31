//
//  CombinationSumIIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/02/2022.
//

import XCTest

@testable import LeetCode

final class CombinationSumIIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let k = 3
        let n = 7
        
        let combinations = CombinationSumIII.combinationSum3(k, n)
        
        XCTAssertEqual(combinations, [[1, 2, 4]])
    }
    
    func test_B() {
        let k = 3
        let n = 9
        
        let combinations = CombinationSumIII.combinationSum3(k, n)
        
        XCTAssertEqual(combinations, [[1, 2, 6], [1, 3, 5], [2, 3, 4]])
    }
    
    func test_C() {
        let k = 4
        let n = 1
        
        let combinations = CombinationSumIII.combinationSum3(k, n)
        
        XCTAssertEqual(combinations, [[Int]]())
    }
}
