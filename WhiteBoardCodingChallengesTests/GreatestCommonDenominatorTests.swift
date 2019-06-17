//
//  GreatestCommonDenominatorTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class GreatestCommonDenominatorTests: XCTestCase {
    
    // MARK: TestLifecycle
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_greatestCommonDenominator() {
        
        let commonDenominator = 28
        
        let gcd = GreatestCommonDenominator.greatestCommonDenominator(lowest: 84, highest: 868)
        
        XCTAssertEqual(gcd, commonDenominator, "GCD should be \(commonDenominator)")
    }
    
}
