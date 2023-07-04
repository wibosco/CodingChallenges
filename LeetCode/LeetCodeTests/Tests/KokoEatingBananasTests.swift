//
//  KokoEatingBananasTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class KokoEatingBananasTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let piles = [3, 6, 7, 11]
        let h = 8
        
        let result = KokoEatingBananas.minEatingSpeed(piles, h)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let piles = [30, 11, 23, 4, 20]
        let h = 5
        
        let result = KokoEatingBananas.minEatingSpeed(piles, h)
        
        XCTAssertEqual(result, 30)
    }
    
    func test_C() {
        let piles = [30, 11, 23, 4, 20]
        let h = 6
        
        let result = KokoEatingBananas.minEatingSpeed(piles, h)
        
        XCTAssertEqual(result, 23)
    }
}
