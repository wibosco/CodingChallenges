//
//  MagicSqaureTests.swift
//  HackerRankTests
//
//  Created by William Boles on 29/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class MagicSqaureTests: XCTestCase {
    // MARK: - Tests
    
    func test_A() {
        let square = [[5, 3, 4], [1, 5, 8], [6, 4, 2]]
        
        let cost = MagicSqaure.formingMagicSquare(s: square)
        
        XCTAssertEqual(7, cost)
    }
    
    func test_B() {
        let square = [[4, 9, 2], [3, 5, 7], [8, 1, 5]]
        
        let cost = MagicSqaure.formingMagicSquare(s: square)
        
        XCTAssertEqual(1, cost)
    }
    
    func test_C() {
        let square = [[4, 8, 2], [4, 5, 7], [6, 1, 6]]
        
        let cost = MagicSqaure.formingMagicSquare(s: square)
        
        XCTAssertEqual(4, cost)
    }
    
    func test_D() {
        let square = [[4, 5, 8], [2, 4, 1], [1, 9, 7]]
        
        let cost = MagicSqaure.formingMagicSquare(s: square)
        
        XCTAssertEqual(14, cost)
    }
}
