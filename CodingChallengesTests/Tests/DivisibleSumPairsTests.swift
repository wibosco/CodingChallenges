//
//  DivisibleSumPairsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 28/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class DivisibleSumPairsTests: XCTestCase {
    // MARK: - Tests
    
    func test_A() {
        let ar = [1, 2, 3, 4, 5, 6]
        let k = 5
        
        let pairsCount = DivisibleSumPairs.divisibleSumPairs(k: k, ar: ar)
        
        XCTAssertEqual(pairsCount, 3)
    }
    
    func test_B() {
        let ar = [1, 3, 2, 6, 1, 2]
        let k = 3
        
        let pairsCount = DivisibleSumPairs.divisibleSumPairs(k: k, ar: ar)
        
        XCTAssertEqual(pairsCount, 5)
    }
}
