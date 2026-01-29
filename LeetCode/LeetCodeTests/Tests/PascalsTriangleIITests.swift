// Created 20/12/2021.

import XCTest

@testable import LeetCode

final class PascalsTriangleIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let rowIndex = 3
        
        let result = PascalsTriangleII().getRow(rowIndex)
        
        XCTAssertEqual(result, [1, 3, 3, 1])
    }
    
    func test_B() {
        let rowIndex = 0
        
        let result = PascalsTriangleII().getRow(rowIndex)
        
        XCTAssertEqual(result, [1])
    }
    
    func test_C() {
        let rowIndex = 1
        
        let result = PascalsTriangleII().getRow(rowIndex)
        
        XCTAssertEqual(result, [1, 1])
    }

}
