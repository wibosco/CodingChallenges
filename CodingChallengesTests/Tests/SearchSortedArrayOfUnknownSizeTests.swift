//
//  SearchSortedArrayOfUnknownSizeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class SearchSortedArrayOfUnknownSizeTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let secret = [-1, 0, 3, 5, 9, 12]
        let target = 9
        
        let reader = ArrayReader(secret: secret)
        let index = SearchSortedArrayOfUnknownSize.search(reader, target)
        
        XCTAssertEqual(index, 4)
    }
    
    func test_B() {
        let secret = [-1, 0, 3, 5, 9, 12]
        let target = 2
        
        let reader = ArrayReader(secret: secret)
        let index = SearchSortedArrayOfUnknownSize.search(reader, target)
        
        XCTAssertEqual(index, -1)
    }
    
}
