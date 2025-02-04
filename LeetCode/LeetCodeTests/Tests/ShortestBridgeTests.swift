//
//  ShortestBridgeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 29/10/2023.
//

import XCTest

@testable import LeetCode

final class ShortestBridgeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let grid = [[0,1],
                    [1,0]]
        
        let result = ShortestBridge().shortestBridge(grid)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let grid = [[0,1,0],
                    [0,0,0],
                    [0,0,1]]
        
        let result = ShortestBridge().shortestBridge(grid)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let grid = [[1,1,1,1,1],
                    [1,0,0,0,1],
                    [1,0,1,0,1],
                    [1,0,0,0,1],
                    [1,1,1,1,1]]
        
        let result = ShortestBridge().shortestBridge(grid)
        
        XCTAssertEqual(result, 1)
    }
}
