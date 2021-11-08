//
//  ReverseStringA.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class ReverseStringAndKeepWordOrderingTests: XCTestCase {
    
    // MARK: Tests
    
    func test_A() {
        let stringToBeReversed = "to be reversed"
        
        let reversedString = ReverseStringAndKeepWordOrdering.reverse(string: stringToBeReversed)
        
        XCTAssertEqual(reversedString, "ot eb desrever", "Should have reversed string maintain ordering of words")
    }
    
}
