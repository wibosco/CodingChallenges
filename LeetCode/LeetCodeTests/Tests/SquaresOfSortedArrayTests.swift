//
//  SquaresOfSortedArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SquaresOfSortedArrayTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let nums = [-4, -1, 0, 3, 10]
        
        let result = SquaresOfSortedArray.sortedSquares(nums)
        
        XCTAssertEqual(result, [0, 1, 9, 16, 100])
    }
    
    func test_B() {
        let nums = [-7, -3, 2, 3, 11]
        
        let result = SquaresOfSortedArray.sortedSquares(nums)
        
        XCTAssertEqual(result, [4, 9, 9, 49, 121])
    }
}
