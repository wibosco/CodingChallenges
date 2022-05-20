//
//  QuickSortTests.swift
//  CodingChallenges
//
//  Created by William Boles on 16/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

class QuickSortTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let sortedArray = Quicksort1Partition.sort(array: [5, 8, 1, 3, 7, 9, 2])
        
        XCTAssertEqual([1, 2, 3, 5, 7, 8, 9], sortedArray)
    }
    
    func test_B() {
        let sortedArray = Quicksort1Partition.sort(array: [5, 8, 1, 3, 7, 9, 2, 12, 14, 15, 16, 22, 23, 25, 4, 10, 6])
        
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 22, 23, 25], sortedArray)
    }

    func test_C() {
        let sortedArray = Quicksort1Partition.sort(array: [5, 8, 1, 3, 7, 5, 9, 2, 9])
        
        XCTAssertEqual([1, 2, 3, 5, 5, 7, 8, 9, 9], sortedArray)
    }
}
