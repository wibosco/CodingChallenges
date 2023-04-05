//
//  BeastTests.swift
//  HackerRankTests
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class BeastTests: XCTestCase {
    
    // MARK: Test
    
    func test_A() {
        let decentNumber = Beast.decentNumber(range: 1)
        
        XCTAssertEqual(decentNumber, "-1")
    }
    
    func test_B() {
        let decentNumber = Beast.decentNumber(range: 3)
        
        XCTAssertEqual(decentNumber, "555")
    }
    
    func test_C() {
        let decentNumber = Beast.decentNumber(range: 5)
        
        XCTAssertEqual(decentNumber, "33333")
    }
}
