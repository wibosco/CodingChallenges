//
//  SherlockSquaresTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import WhiteBoardCodingChallenges

class SherlockSquaresTests: XCTestCase {
    
    // MARK: Tests
    
    func test_squaresWithRange3to9() {
        
        let count = SherlockSquares.findCountOfSquaresBetweenARange(lowerBoundary: 3, upperBoundary: 9)
        
        XCTAssertEqual(2, count)
    }
    
    func test_squaresWithRange17to24() {
        
        let count = SherlockSquares.findCountOfSquaresBetweenARange(lowerBoundary: 17, upperBoundary: 24)
        
        XCTAssertEqual(0, count)
    }
    
    func test_squaresWithRange3to16() {
        
        let count = SherlockSquares.findCountOfSquaresBetweenARange(lowerBoundary: 3, upperBoundary: 16)
        
        XCTAssertEqual(3, count)
    }
    
    func test_squaresWithLargeRange() {
        
        let count = SherlockSquares.findCountOfSquaresBetweenARange(lowerBoundary: 150336667, upperBoundary: 828238028)
        
        XCTAssertEqual(16518, count)
    }

    
}
