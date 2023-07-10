//
//  NumberOfPairsOfInterchangeableRectanglesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/07/2023.
//

import XCTest

@testable import LeetCode

final class NumberOfPairsOfInterchangeableRectanglesTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let rectangles = [[4, 8],
                          [3, 6],
                          [10, 20],
                          [15, 30]]
        
        let result = NumberOfPairsOfInterchangeableRectangles.interchangeableRectangles(rectangles)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_B() {
        let rectangles = [[4, 5],
                          [7, 8]]
        
        let result = NumberOfPairsOfInterchangeableRectangles.interchangeableRectangles(rectangles)
        
        XCTAssertEqual(result, 0)
    }
}
