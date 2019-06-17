//
//  MaximizeSumTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 11/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class MaximizeSumTests: XCTestCase {
    
    // MARK: Tests
    
    func test_maximizeSumA() {
        let values = [3,3,9,9,5]
        let modulo = 7
        
        let maximum = MaximizeSum.maximizeSum(values: values, modulo: modulo)
        
        XCTAssertEqual(maximum, 6)
    }
    
}
