// Created 24/02/2024.

import XCTest

@testable import LeetCode

final class CountNegativeNumbersInASortedMatrixTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let grid = [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]
        
        let result = CountNegativeNumbersInASortedMatrix().countNegatives(grid)
        
        XCTAssertEqual(result, 8)
    }
    
    func test_B() {
        let grid = [[3,2],[1,0]]
        
        let result = CountNegativeNumbersInASortedMatrix().countNegatives(grid)
        
        XCTAssertEqual(result, 0)
    }
}
