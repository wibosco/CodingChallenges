//
//  FindDigitsTests.swift
//  HackerRankTests
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class FindDigitsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        
        let divisibles = FindDigits.findCountOfDivisibleValuesOfNumberInNumber(number: 12)
        
        XCTAssertEqual(2, divisibles)
    }
    
    func test_B() {
        
        let divisibles = FindDigits.findCountOfDivisibleValuesOfNumberInNumber(number: 1012)
        
        XCTAssertEqual(3, divisibles)
    }
    
}
