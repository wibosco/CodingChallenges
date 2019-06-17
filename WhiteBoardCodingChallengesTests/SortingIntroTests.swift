//
//  SortingIntroTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 15/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class SortingIntroTests: XCTestCase {
    
    // MARK: Tests
    
    func test_sortingIntroA() {
        
        let index = SortingIntro.indexOfValue(value: 4, array: [1, 4, 5, 7, 9, 12])
        
        XCTAssertEqual(1, index)
    }
}
