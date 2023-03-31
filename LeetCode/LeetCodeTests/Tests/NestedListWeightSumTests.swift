//
//  NestedListWeightSumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 30/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class NestedListWeightSumTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = "[[1,1],2,[1,1]]"
        let nestedList = NestedInteger.deserialize(data)
        
        let sum = NestedListWeightSum.depthSum([nestedList])
        
        XCTAssertEqual(sum, 10)
    }
    
    func test_B() {
        let data = "[1,[4,[6]]]"
        let nestedList = NestedInteger.deserialize(data)
        
        let sum = NestedListWeightSum.depthSum([nestedList])
        
        XCTAssertEqual(sum, 27)
    }
}
