// Created 01/03/2024.


import XCTest

@testable import LeetCode

final class FindSmallestCommonElementInAllRowsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let mat = [[1,2,3,4,5],
                   [2,4,5,8,10],
                   [3,5,7,9,11],
                   [1,3,5,7,9]]
        
        let result = FindSmallestCommonElementInAllRows().smallestCommonElement(mat)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let mat = [[1,2,3],
                   [2,3,4],
                   [2,3,5]]
        
        let result = FindSmallestCommonElementInAllRows().smallestCommonElement(mat)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let mat = [[1,3,7],
                   [3,4,8],
                   [2,5,9]]
        
        let result = FindSmallestCommonElementInAllRows().smallestCommonElement(mat)
        
        XCTAssertEqual(result, -1)
    }
}
