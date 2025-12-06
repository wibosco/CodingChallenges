// Created 03/04/2022.


import XCTest

@testable import LeetCode

final class IsGraphBipartiteTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let graph = [[1, 2, 3], [0, 2], [0, 1, 3], [0, 2]]
        
        let result = IsGraphBipartite().isBipartite(graph)
        
        XCTAssertFalse(result)
    }
    
    func test_B() {
        let graph = [[1, 3], [0, 2], [1, 3], [0, 2]]
        
        let result = IsGraphBipartite().isBipartite(graph)
        
        XCTAssertTrue(result)
    }
}
