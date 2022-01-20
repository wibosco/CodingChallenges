//
//  HappyNumberTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class HappyNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 19
        
        let isHappy = HappyNumber.isHappy(n)
        
        XCTAssertTrue(isHappy)
    }
    
    func test_B() {
        let n = 2
        
        let isHappy = HappyNumber.isHappy(n)
        
        XCTAssertFalse(isHappy)
    }
    
    func test_C() {
        let n = 1
        
        let isHappy = HappyNumber.isHappy(n)
        
        XCTAssertTrue(isHappy)
    }
}
