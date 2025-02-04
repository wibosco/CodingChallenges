//
//  UniqueBinarySearchTreesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 22/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class UniqueBinarySearchTreesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 3
        
        let result = UniqueBinarySearchTrees().numTrees(n)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let n = 1
        
        let result = UniqueBinarySearchTrees().numTrees(n)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let n = 2
        
        let result = UniqueBinarySearchTrees().numTrees(n)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_D() {
        let n = 7
        
        let result = UniqueBinarySearchTrees().numTrees(n)
        
        XCTAssertEqual(result, 429)
    }
}
