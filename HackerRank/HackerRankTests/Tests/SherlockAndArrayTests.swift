//
//  SherlockAndArrayTests.swift
//  CodingChallenges
//
//  Created by William Boles on 07/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class SherlockAndArrayTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let array = [1,2,3]
        let possible = SherlockAndArray.leftRightEqualityPossible(array: array)
        
        XCTAssertFalse(possible)
    }
    
    func test_B() {
        let array = [1,2,3,3]
        let possible = SherlockAndArray.leftRightEqualityPossible(array: array)
        
        XCTAssertTrue(possible)
    }
}
