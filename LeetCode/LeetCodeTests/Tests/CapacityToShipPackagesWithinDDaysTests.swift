//
//  CapacityToShipPackagesWithinDDaysTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 14/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class CapacityToShipPackagesWithinDDaysTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let weights = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let days = 5
        
        let capacity = CapacityToShipPackagesWithinDDays.shipWithinDays(weights, days)
        
        XCTAssertEqual(capacity, 15)
    }
    
    func test_B() {
        let weights = [3, 2, 2, 4, 1, 4]
        let days = 3
        
        let capacity = CapacityToShipPackagesWithinDDays.shipWithinDays(weights, days)
        
        XCTAssertEqual(capacity, 6)
    }
    
    func test_C() {
        let weights = [1, 2, 3, 1, 1]
        let days = 4
        
        let capacity = CapacityToShipPackagesWithinDDays.shipWithinDays(weights, days)
        
        XCTAssertEqual(capacity, 3)
    }
}
