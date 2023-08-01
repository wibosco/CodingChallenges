//
//  SuccessfulPairsOfSpellsAndPotionsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/08/2023.
//

import XCTest

@testable import LeetCode

final class SuccessfulPairsOfSpellsAndPotionsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let spells = [5, 1, 3]
        let potions = [1, 2, 3, 4, 5]
        let success = 7
            
        let result = SuccessfulPairsOfSpellsAndPotions.successfulPairs(spells, potions, success)
        
        XCTAssertEqual(result, [4, 0, 3])
    }
    
    func test_B() {
        let spells = [3, 1, 2]
        let potions = [8, 5, 8]
        let success = 16
            
        let result = SuccessfulPairsOfSpellsAndPotions.successfulPairs(spells, potions, success)
        
        XCTAssertEqual(result, [2, 0, 2])
    }
}
