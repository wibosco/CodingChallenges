//
//  UniquePathsIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/04/2022.
//

import XCTest

@testable import LeetCode

class UniquePathsIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let obstacleGrid = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]
        
        let paths = UniquePathsII.uniquePathsWithObstacles(obstacleGrid)
        
        XCTAssertEqual(paths, 2)
    }
    
    func test_B() {
        let obstacleGrid = [[0, 1], [0, 0]]
        
        let paths = UniquePathsII.uniquePathsWithObstacles(obstacleGrid)
        
        XCTAssertEqual(paths, 1)
    }
    
    func test_C() {
        let obstacleGrid = [[1, 1], [0, 0]]
        
        let paths = UniquePathsII.uniquePathsWithObstacles(obstacleGrid)
        
        XCTAssertEqual(paths, 0)
    }
}
