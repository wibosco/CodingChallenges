//
//  PlusMinusTests.swift
//  HackerRankTests
//
//  Created by Boles on 07/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class PercentagesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let percentages = Percentages.percentageOfUniqueSets(array: [-4, 3, -9, 0, 4, 1])
        
        XCTAssertEqual(0.500000, percentages.positivePercentage, accuracy: 0.000001, "Positive percentage did not match expected result")
        XCTAssertEqual(0.333333, percentages.negativePercentage, accuracy: 0.000001, "Negative percentage did not match expected result")
        XCTAssertEqual(0.166667, percentages.zeroPercentage, accuracy: 0.000001, "Positive percentage did not match expected result")
    }
    
}
