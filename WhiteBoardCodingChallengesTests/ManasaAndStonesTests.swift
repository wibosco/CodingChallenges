//
//  ManasaAndStonesTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class ManasaAndStonesTests: XCTestCase {
    
    // MARK: Tests
    
    func test_possibleValuesA() {
        
        let possibleValues = ManasaAndStones.possibleValuesForFinalStone(3, gapValueA: 1, gapValueB: 2)

        XCTAssertEqual(Set([2, 3, 4]), possibleValues)
    }
    
    func test_possibleValuesB() {
        
        let possibleValues = ManasaAndStones.possibleValuesForFinalStone(4, gapValueA: 10, gapValueB: 100)
        
        XCTAssertEqual(Set([30, 120, 210, 300]), possibleValues)
    }
    
    func test_possibleValuesC() {
        
        let possibleValues = ManasaAndStones.possibleValuesForFinalStone(6, gapValueA: 4, gapValueB: 8)
        
        XCTAssertEqual(Set([20, 24, 28, 32, 36, 40]), possibleValues)
    }
    
    func test_possibleValuesD() {
        
        let possibleValues = ManasaAndStones.possibleValuesForFinalStone(11, gapValueA: 3, gapValueB: 10)
        
        XCTAssertEqual(Set([30, 37, 44, 51, 58, 65, 72, 79, 86, 93, 100]), possibleValues)
    }
}
