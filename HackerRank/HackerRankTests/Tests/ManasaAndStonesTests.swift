//
//  ManasaAndStonesTests.swift
//  CodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class ManasaAndStonesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let possibleValues = ManasaAndStones.possibleValuesForFinalStone(numberOfStones: 3, gapValueA: 1, gapValueB: 2)

        XCTAssertEqual(Set([2, 3, 4]), possibleValues)
    }
    
    func test_B() {
        let possibleValues = ManasaAndStones.possibleValuesForFinalStone(numberOfStones: 4, gapValueA: 10, gapValueB: 100)
        
        XCTAssertEqual(Set([30, 120, 210, 300]), possibleValues)
    }
    
    func test_C() {
        let possibleValues = ManasaAndStones.possibleValuesForFinalStone(numberOfStones: 6, gapValueA: 4, gapValueB: 8)
        
        XCTAssertEqual(Set([20, 24, 28, 32, 36, 40]), possibleValues)
    }
    
    func test_D() {
        let possibleValues = ManasaAndStones.possibleValuesForFinalStone(numberOfStones: 11, gapValueA: 3, gapValueB: 10)
        
        XCTAssertEqual(Set([30, 37, 44, 51, 58, 65, 72, 79, 86, 93, 100]), possibleValues)
    }
}
