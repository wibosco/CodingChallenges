//
//  FloodFillTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FloodFillTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let image = [[1, 1, 1],
                     [1, 1, 0],
                     [1, 0, 1]]
        let sr = 1
        let sc = 1
        let newColor = 2
        
        let result = FloodFill.floodFill(image, sr, sc, newColor)
        
        XCTAssertEqual(result, [[2, 2, 2], [2, 2, 0], [2, 0, 1]])
    }
    
    func test_B() {
        let image = [[0, 0, 0],
                     [0, 0, 0]]
        let sr = 0
        let sc = 0
        let newColor = 2
        
        let result = FloodFill.floodFill(image, sr, sc, newColor)
        
        XCTAssertEqual(result, [[2, 2, 2], [2, 2, 2]])
    }
    
    func test_C() {
        let image = [[1, 1, 1],
                     [1, 1, 0],
                     [1, 0, 1]]
        let sr = 1
        let sc = 1
        let newColor = 2
        
        let result = FloodFill.floodFill(image, sr, sc, newColor)
        
        XCTAssertEqual(result, [[2, 2, 2], [2, 2, 0], [2, 0, 1]])
    }
}
