//
//  DecimalToBinaryTests.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class DecimalToBinaryTests: XCTestCase {
    
    // MARK: Tests
    
    func test_A() {
        let decimalValue = 294
        
        let binaryValue = DecimalToBinary.convertDecimalToBinary(decimal: decimalValue)
        
        XCTAssertEqual(binaryValue, "100100110")
    }
    
}
