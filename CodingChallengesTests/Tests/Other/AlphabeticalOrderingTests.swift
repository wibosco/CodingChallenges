//
//  AlphabeticalOrderingTests.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class AlphabeticalOrderingTests: XCTestCase {

    // MARK: Tests
    
    func test_A() {
        let stringToBeSorted = "to be sorted as a big string"
        
        let sortedString = AlphabeticalOrdering.sort(string: stringToBeSorted)
        
        XCTAssertEqual(sortedString, "a as be big sorted string to", "Should have sorted by alphabetical ordering")
    }
    
}
