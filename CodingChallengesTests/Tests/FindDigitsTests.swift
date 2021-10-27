//
//  FindDigitsTests.swift
//  CodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class FindDigitsTests: XCTestCase {
    
    // MARK: Tests
    
    func test_divisableValuesOf12() {
        
        let divisables = FindDigits.findCountOFDivisableValuesOfNumberInNumber(number: 12)
        
        XCTAssertEqual(2, divisables)
    }
    
    func test_divisableValuesOf1012() {
        
        let divisables = FindDigits.findCountOFDivisableValuesOfNumberInNumber(number: 1012)
        
        XCTAssertEqual(3, divisables)
    }
    
}
