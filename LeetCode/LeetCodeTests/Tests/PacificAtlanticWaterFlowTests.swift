// Created 12/04/2023.


import XCTest

@testable import LeetCode

final class PacificAtlanticWaterFlowTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let heights = [[1, 2, 2, 3, 5],
                       [3, 2, 3, 4, 4],
                       [2, 4, 5, 3, 1],
                       [6, 7, 1, 4, 5],
                       [5, 1, 1, 2, 4]]
        
        let result = PacificAtlanticWaterFlow().pacificAtlantic(heights)
        
        let expectedResult = [[0, 4],
                              [1, 3],
                              [1, 4],
                              [2, 2],
                              [3, 0],
                              [3, 1],
                              [4, 0]]
        
        //order isn't important
        for r in result {
            XCTAssertTrue(expectedResult.contains(r))
        }
        
        XCTAssertEqual(result.count, expectedResult.count)
    }
    
    func test_B() {
        let heights = [[1]]
        
        let result = PacificAtlanticWaterFlow().pacificAtlantic(heights)
        
        XCTAssertEqual(result, [[0, 0]])
    }
    
    func test_C() {
        let heights = [[1, 2, 3],
                       [8, 9, 4],
                       [7, 6, 5]]
        
        let result = PacificAtlanticWaterFlow().pacificAtlantic(heights)
        
        let expectedResult = [[0, 2],
                              [1, 0],
                              [1, 1],
                              [1, 2],
                              [2, 0],
                              [2, 1],
                              [2, 2]]
        
        //order isn't important
        for r in result {
            XCTAssertTrue(expectedResult.contains(r))
        }
        
        XCTAssertEqual(result.count, expectedResult.count)
    }
    
    func test_D() {
        let heights = [[1, 1],
                       [1, 1],
                       [1, 1]]
        
        let result = PacificAtlanticWaterFlow().pacificAtlantic(heights)
        
        let expectedResult = [[0, 0],
                              [0, 1],
                              [1, 0],
                              [1, 1],
                              [2, 0],
                              [2, 1]]
        
        //order isn't important
        for r in result {
            XCTAssertTrue(expectedResult.contains(r))
        }
        
        XCTAssertEqual(result.count, expectedResult.count)
    }
}
