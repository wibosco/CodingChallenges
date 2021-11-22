//
//  KaprekarTests.swift
//  CodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class KaprekarTests: XCTestCase {
    
    // MARK: Tests
    
    func test_A() {
        let range = Kaprekar.kaprekarRange(lowerBounds: 1, upperBounds: 100)
        
        XCTAssertEqual([1, 9, 45, 55, 99], range)
    }
    
    func test_B() {
        let range = Kaprekar.kaprekarRange(lowerBounds: 297, upperBounds: 300)
        
        XCTAssertEqual([297], range)
    }
    
}
