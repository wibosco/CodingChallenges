// Created 15/05/2016.

import XCTest

@testable import HackerRank

final class InsertionSort2Tests: XCTestCase {
    
    func test_A() {
        
        let steps = InsertionSort2.sort(array: [1, 4, 3, 5, 6, 2])
        
        let expectedSteps = [[1, 4, 3, 5, 6, 2],
                             [1, 3, 4, 5, 6, 2],
                             [1, 3, 4, 5, 6, 2],
                             [1, 3, 4, 5, 6, 2],
                             [1, 2, 3, 4, 5, 6]]
        
        XCTAssertEqual(expectedSteps, steps)
    }
    
    func test_B() {
        
        let steps = InsertionSort2.sort(array: [9, 8, 6, 7, 3, 5, 4, 1, 2])
        
        let expectedSteps = [[8, 9, 6, 7, 3, 5, 4, 1, 2],
                             [6, 8, 9, 7, 3, 5, 4, 1, 2],
                             [6, 7, 8, 9, 3, 5, 4, 1, 2],
                             [3, 6, 7, 8, 9, 5, 4, 1, 2],
                             [3, 5, 6, 7, 8, 9, 4, 1, 2],
                             [3, 4, 5, 6, 7, 8, 9, 1, 2],
                             [1, 3, 4, 5, 6, 7, 8, 9, 2],
                             [1, 2, 3, 4, 5, 6, 7, 8, 9]]
        
        XCTAssertEqual(expectedSteps, steps)
    }
}
