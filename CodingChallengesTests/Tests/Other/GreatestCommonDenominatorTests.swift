//
//  GreatestCommonDenominatorTests.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class GreatestCommonDenominatorTests: XCTestCase {
    
    // MARK: Tests
    
    func test_A() {
        let gcd = GreatestCommonDenominator.greatestCommonDenominator(lowest: 84, highest: 868)
        
        XCTAssertEqual(gcd, 28)
    }
    
}
