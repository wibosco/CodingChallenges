//
//  NestedListWeightSumIITests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class NestedListWeightSumIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = "[[1,1],2,[1,1]]"
        let nestedList = NestedInteger.deserialize(data)
        
        let sum = NestedListWeightSumII.depthSumInverse([nestedList])
        
        XCTAssertEqual(sum, 8)
    }
    
    func test_B() {
        let data = "[1,[4,[6]]]"
        let nestedList = NestedInteger.deserialize(data)
        
        let sum = NestedListWeightSumII.depthSumInverse([nestedList])
        
        XCTAssertEqual(sum, 17)
    }

}
