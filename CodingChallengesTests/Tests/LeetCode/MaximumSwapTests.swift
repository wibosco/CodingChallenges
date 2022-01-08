//
//  MaximumSwapTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 03/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class MaximumSwapTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let num = 2736
        
        let max = MaximumSwap.maximumSwap(num)
        
        XCTAssertEqual(max, 7236)
    }
    
    func test_B() {
        let num = 9973
        
        let max = MaximumSwap.maximumSwap(num)
        
        XCTAssertEqual(max, 9973)
    }
}
