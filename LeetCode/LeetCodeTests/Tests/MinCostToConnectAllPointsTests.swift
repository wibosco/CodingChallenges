//
//  MinCostToConnectAllPointsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class MinCostToConnectAllPointsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let points = [[0, 0],
                      [2, 2],
                      [3, 10],
                      [5, 2],
                      [7, 0]]
        
        let result = MinCostToConnectAllPoints.minCostConnectPoints(points)
        
        XCTAssertEqual(result, 20)
    }
    
    func test_B() {
        let points = [[3, 12],
                      [-2, 5],
                      [-4, 1]]
        
        let result = MinCostToConnectAllPoints.minCostConnectPoints(points)
        
        XCTAssertEqual(result, 18)
    }
    
    func test_C() {
        let points = [[0, 0],
                      [1, 1],
                      [1, 0],
                      [-1, 1]]
        
        let result = MinCostToConnectAllPoints.minCostConnectPoints(points)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_D() {
        let points = [[-1000000, -1000000],
                      [1000000, 1000000]]
        
        let result = MinCostToConnectAllPoints.minCostConnectPoints(points)
        
        XCTAssertEqual(result, 4000000)
    }
    
    func test_E() {
        let points = [[0, 0]]
        
        let result = MinCostToConnectAllPoints.minCostConnectPoints(points)
        
        XCTAssertEqual(result, 0)
    }
}
