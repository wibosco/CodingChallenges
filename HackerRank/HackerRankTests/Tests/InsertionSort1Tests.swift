// Created 15/05/2016.


import XCTest

@testable import HackerRank

final class InsertionSort1Tests: XCTestCase {
    
    // MARK: RightMost
    
    func test_A() {
        
        let steps = InsertionSort1.sortRightMostElementIntoCorrectPosition(array: [2, 4, 6, 8, 3])
        
        let expectedSteps = [[2, 4, 6, 8, 8],
                             [2, 4, 6, 6, 8],
                             [2, 4, 4, 6, 8],
                             [2, 3, 4, 6, 8]]
        
        XCTAssertEqual(expectedSteps, steps)
    }
}
