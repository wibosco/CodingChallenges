//
//  ShortestPathWithAlternatingColorsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 30/10/2023.
//

import XCTest

@testable import LeetCode

final class ShortestPathWithAlternatingColorsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let n = 3
        let redEdges = [[0,1],
                        [1,2]]
        let blueEdges = [[Int]]()
        
        let result = ShortestPathWithAlternatingColors().shortestAlternatingPaths(n, redEdges, blueEdges)
        
        XCTAssertEqual(result, [0,1,-1])
    }
    
    func test_B() {
        let n = 3
        let redEdges = [[0,1]]
        let blueEdges = [[2, 1]]
        
        let result = ShortestPathWithAlternatingColors().shortestAlternatingPaths(n, redEdges, blueEdges)
        
        XCTAssertEqual(result, [0,1,-1])
    }
    
    func test_C() {
        let n = 3
        let redEdges = [[0,1]]
        let blueEdges = [[1,0]]
        
        let result = ShortestPathWithAlternatingColors().shortestAlternatingPaths(n, redEdges, blueEdges)
        
        XCTAssertEqual(result, [0,1,-1])
    }
    
    func test_D() {
        let n = 5
        let redEdges = [[2,0],
                        [4,3],
                        [4,4],
                        [3,0],
                        [1,4]]
        let blueEdges = [[2,1],
                         [4,3],
                         [3,1],
                         [3,0],
                         [1,1],
                         [2,0],
                         [0,3],
                         [3,3],
                         [2,3]]
        
        let result = ShortestPathWithAlternatingColors().shortestAlternatingPaths(n, redEdges, blueEdges)
        
        XCTAssertEqual(result, [0,-1,-1,1,-1])
    }
    
    func test_E() {
        let n = 5
        let redEdges = [[0,1],
                        [1,2],
                        [2,3],
                        [3,4]]
        let blueEdges = [[1,2],
                         [2,3],
                         [3,1]]
        
        let result = ShortestPathWithAlternatingColors().shortestAlternatingPaths(n, redEdges, blueEdges)
        
        XCTAssertEqual(result, [0,1,2,3,7])
    }
}
