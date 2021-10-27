//
//  AlphabeticalOrderingTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import WhiteBoardCodingChallenges

class AlphabeticalOrderingTests: XCTestCase {
    
    // MARK: TestLifecycle
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    // MARK: Tests
    
    func test_alphabeticalSort() {
        
        let stringToBeSorted = "to be sorted as a big string"
        
        let sortedString = AlphabeticalOrdering.sort(string: stringToBeSorted)
        
        XCTAssertEqual(sortedString, "a as be big sorted string to", "Should have sorted by alphabetical ordering")
    }
    
}
