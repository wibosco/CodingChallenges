// Created 29/11/2021.

import XCTest

@testable import LeetCode

final class GraphValidTreeTests: XCTestCase {

    // MARK: - Tests

    func test_A() {
        let n = 5
        let edges = [[0, 1],
                     [0, 2],
                     [0, 3],
                     [1, 4]]
        
        let result = GraphValidTree().validTree(n, edges)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let n = 5
        let edges = [[0, 1],
                     [1, 2],
                     [2, 3],
                     [1, 3],
                     [1, 4]]
        
        let result = GraphValidTree().validTree(n, edges)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let n = 5
        let edges = [[0, 1],
                     [1, 2],
                     [3, 4]]
        
        let result = GraphValidTree().validTree(n, edges)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let n = 5
        let edges = [[0, 1],
                     [1, 2]]
        
        let result = GraphValidTree().validTree(n, edges)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let n = 2
        let edges = [[1, 0]]
        
        let result = GraphValidTree().validTree(n, edges)
        
        XCTAssertTrue(result)
    }
    
    func test_F() {
        let n = 5
        let edges = [[0, 1],
                     [0, 4],
                     [1, 4],
                     [2, 3]]
        
        let result = GraphValidTree().validTree(n, edges)
        
        XCTAssertFalse(result)
    }
}
