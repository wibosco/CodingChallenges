//
//  InsertionSort1Tests.swift
//  WhiteBoardCodingChallenges
//
//  Created by Boles on 15/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import WhiteBoardCodingChallenges

class InsertionSort1Tests: XCTestCase {
    
    // MARK: RightMost
    
    func test_insertionSortRightMostA() {
        
        let steps = InsertionSort1.sortRightMostElementIntoCorrectPosition(array: [2, 4, 6, 8, 3])
        
        let expectedSteps = [[2, 4, 6, 8, 8],
                             [2, 4, 6, 6, 8],
                             [2, 4, 4, 6, 8],
                             [2, 3, 4, 6, 8]]
        
        XCTAssertEqual(expectedSteps, steps)
    }
}
