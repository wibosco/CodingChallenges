// Created 15/12/2021.

import XCTest

@testable import LeetCode

final class Matrix01Tests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let mat = [[0, 0, 0],
                   [0, 1, 0],
                   [0, 0, 0]]
        
        let result = Matrix01().updateMatrix(mat)
        
        XCTAssertEqual(result, [[0, 0, 0], [0, 1, 0], [0, 0, 0]])
    }
    
    func test_B() {
        let mat = [[0, 0, 0],
                   [0, 1, 0],
                   [1, 1, 1]]
        
        let result = Matrix01().updateMatrix(mat)
        
        XCTAssertEqual(result, [[0, 0, 0], [0, 1, 0], [1, 2, 1]])
    }
}
