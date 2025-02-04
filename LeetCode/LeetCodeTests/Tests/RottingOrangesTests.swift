//
//  RottingOrangesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 06/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class RottingOrangesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let grid = [[2, 1, 1],
                    [1, 1, 0],
                    [0, 1, 1]]
        
        let result = RottingOranges().orangesRotting(grid)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let grid = [[2, 1, 1],
                    [0, 1, 1],
                    [1, 0, 1]]
        
        let result = RottingOranges().orangesRotting(grid)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let grid = [[0, 2]]
        
        let result = RottingOranges().orangesRotting(grid)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let grid = [[0]]
        
        let result = RottingOranges().orangesRotting(grid)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_E() {
        let grid = [[1]]
        
        let result = RottingOranges().orangesRotting(grid)
        
        XCTAssertEqual(result, -1)
    }

    func test_F() {
        let grid = [[0, 1]]
        
        let result = RottingOranges().orangesRotting(grid)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_G() {
        let grid = [[2, 2],
                    [1, 1],
                    [0, 0],
                    [2, 0]]
        
        let result = RottingOranges().orangesRotting(grid)
        
        XCTAssertEqual(result, 1)
    }
}
