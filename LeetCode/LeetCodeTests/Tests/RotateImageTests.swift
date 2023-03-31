//
//  RotateImageTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/03/2022.
//

import XCTest

@testable import LeetCode

final class RotateImageTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        var matrix = [[1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9]]
        
        RotateImage.rotate(&matrix)
        
        XCTAssertEqual(matrix, [[7, 4, 1], [8, 5, 2], [9, 6, 3]])
    }
    
    func test_B() {
        var matrix = [[5, 1, 9, 11],
                      [2, 4, 8, 10],
                      [13, 3, 6, 7],
                      [15, 14, 12, 16]]
        
        RotateImage.rotate(&matrix)
        
        XCTAssertEqual(matrix, [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]])
    }
    
    func test_C() {
        var matrix = [[1]]
        
        RotateImage.rotate(&matrix)
        
        XCTAssertEqual(matrix, [[1]])
    }
    
    func test_D() {
        var matrix = [[1, 2],
                      [3, 4]]
        
        RotateImage.rotate(&matrix)
        
        XCTAssertEqual(matrix, [[3, 1], [4, 2]])
    }
}
