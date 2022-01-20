//
//  KokoEatingBananasTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class KokoEatingBananasTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let piles = [3, 6, 7, 11]
        let h = 8
        
        let min = KokoEatingBananas.minEatingSpeed(piles, h)
        
        XCTAssertEqual(min, 4)
    }
    
    func test_B() {
        let piles = [30, 11, 23, 4, 20]
        let h = 5
        
        let min = KokoEatingBananas.minEatingSpeed(piles, h)
        
        XCTAssertEqual(min, 30)
    }
    
    func test_C() {
        let piles = [30, 11, 23, 4, 20]
        let h = 6
        
        let min = KokoEatingBananas.minEatingSpeed(piles, h)
        
        XCTAssertEqual(min, 23)
    }
}
