//
//  FindDigitsTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class FindDigitsTests: XCTestCase {
    

    // MARK: Tests
    
    func test_divisableValuesOf12() {
        
        let divisables = FindDigits.findCountOFDivisableValuesOfNumberInNumber(12)
        
        XCTAssertEqual(2, divisables)
    }
    
    func test_divisableValuesOf1012() {
        
        let divisables = FindDigits.findCountOFDivisableValuesOfNumberInNumber(1012)
        
        XCTAssertEqual(3, divisables)
    }
    
}
