// Created 07/07/2023.


import XCTest

@testable import LeetCode

final class PascalsTriangleTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let numRows = 5
        
        let result = PascalsTriangle().generate(numRows)
        
        XCTAssertEqual(result, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]])
    }
    
    func test_B() {
        let numRows = 1
        let result = PascalsTriangle().generate(numRows)
        
        XCTAssertEqual(result, [[1]])
    }
}
