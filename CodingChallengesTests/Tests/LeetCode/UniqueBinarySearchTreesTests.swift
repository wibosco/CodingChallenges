//
//  UniqueBinarySearchTreesTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 22/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class UniqueBinarySearchTreesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 3
        
        let count = UniqueBinarySearchTrees.numTrees(n)
        
        XCTAssertEqual(count,  5)
    }
    
    func test_B() {
        let n = 1
        
        let count = UniqueBinarySearchTrees.numTrees(n)
        
        XCTAssertEqual(count,  1)
    }
    
    func test_C() {
        let n = 2
        
        let count = UniqueBinarySearchTrees.numTrees(n)
        
        XCTAssertEqual(count,  2)
    }
    
    func test_D() {
        let n = 7
        
        let count = UniqueBinarySearchTrees.numTrees(n)
        
        XCTAssertEqual(count,  429)
    }
}
