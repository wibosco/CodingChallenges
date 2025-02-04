//
//  HandOfStraightsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/07/2023.
//

import XCTest

@testable import LeetCode

final class HandOfStraightsTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let hand = [1, 2, 3, 6, 2, 3, 4, 7, 8]
        let groupSize = 3
        
        let result = HandOfStraights().isNStraightHand(hand, groupSize)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let hand = [1, 2, 3, 4, 5]
        let groupSize = 4
        
        let result = HandOfStraights().isNStraightHand(hand, groupSize)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let hand = [8, 10, 12]
        let groupSize = 3
        
        let result = HandOfStraights().isNStraightHand(hand, groupSize)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let hand = [1, 1, 2, 2, 3, 3]
        let groupSize = 2
        
        let result = HandOfStraights().isNStraightHand(hand, groupSize)
        
        XCTAssertFalse(result)
    }
}
