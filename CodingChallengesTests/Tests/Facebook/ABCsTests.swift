//
//  ABCsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ABCsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let a = 1
        let b = 2
        let c = 3
        
        let sum = ABCs.sum(a: a, b: b, c: c)
        
        XCTAssertEqual(sum, 6)
    }
    
    func test_B() {
        let a = 100
        let b = 100
        let c = 100
        
        let sum = ABCs.sum(a: a, b: b, c: c)
        
        XCTAssertEqual(sum, 300)
    }
    
    func test_C() {
        let a = 85
        let b = 16
        let c = 93
        
        let sum = ABCs.sum(a: a, b: b, c: c)
        
        XCTAssertEqual(sum, 194)
    }
}
