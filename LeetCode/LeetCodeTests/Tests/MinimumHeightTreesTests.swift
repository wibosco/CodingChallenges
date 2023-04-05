//
//  MinimumHeightTreesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 05/04/2023.
//

import XCTest

@testable import LeetCode

final class MinimumHeightTreesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 4
        let edges = [[1, 0], [1, 2], [1, 3]]
        
        let trees = MinimumHeightTrees.findMinHeightTrees(n, edges)
        
        XCTAssertEqual(trees, [1])
    }
    
    func test_B() {
        let n = 6
        let edges = [[3, 0], [3, 1], [3, 2], [3, 4], [5, 4]]
        
        let trees = MinimumHeightTrees.findMinHeightTrees(n, edges)
        
        XCTAssertEqual(trees, [3, 4])
    }
    
    func test_C() {
        let n = 1
        let edges = [[Int]]()
        
        let trees = MinimumHeightTrees.findMinHeightTrees(n, edges)
        
        XCTAssertEqual(trees, [0])
    }
}
