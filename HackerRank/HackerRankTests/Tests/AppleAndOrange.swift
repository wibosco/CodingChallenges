//
//  AppleAndOrange.swift
//  CodingChallengesTests
//
//  Created by William Boles on 27/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

class AppleAndOrangeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let start = 7
        let end = 10
        
        let appleTree = 4
        let orangeTree = 12
        
        let apples = [2, 3, -4]
        let oranges = [3, -2, -4]
        
        let (appleHits, orangeHits) = AppleAndOrange.countAppleAndOrangesHittingHouse(houseStart: start,
                                                                                      houseEnd: end,
                                                                                      appleTree: appleTree,
                                                                                      orangeTree: orangeTree,
                                                                                      apples: apples,
                                                                                      oranges: oranges)
        
        XCTAssertEqual(appleHits, 1)
        XCTAssertEqual(orangeHits, 2)
    }
    
    func test_B() {
        let start = 7
        let end = 11
        
        let appleTree = 5
        let orangeTree = 15
        
        let apples = [-2, 2, 1]
        let oranges = [5, -6]
        
        let (appleHits, orangeHits) = AppleAndOrange.countAppleAndOrangesHittingHouse(houseStart: start,
                                                                                      houseEnd: end,
                                                                                      appleTree: appleTree,
                                                                                      orangeTree: orangeTree,
                                                                                      apples: apples,
                                                                                      oranges: oranges)
        
        XCTAssertEqual(appleHits, 1)
        XCTAssertEqual(orangeHits, 1)
    }
}
