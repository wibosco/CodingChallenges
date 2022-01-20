//
//  SearchInsertPositionTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 20/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class SearchInsertPositionTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 3, 5, 6]
        let target = 5
        
        let index = SearchInsertPosition.searchInsert(nums, target)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_B() {
        let nums = [1, 3, 5, 6]
        let target = 2
        
        let index = SearchInsertPosition.searchInsert(nums, target)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_C() {
        let nums = [1, 3, 5, 6]
        let target = 7
        
        let index = SearchInsertPosition.searchInsert(nums, target)
        
        XCTAssertEqual(index, 4)
    }
    
    func test_D() {
        let nums = [1]
        let target = 1
        
        let index = SearchInsertPosition.searchInsert(nums, target)
        
        XCTAssertEqual(index, 0)
    }
}
