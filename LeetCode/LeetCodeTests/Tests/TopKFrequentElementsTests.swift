//
//  TopKFrequentElementsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class TopKFrequentElementsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 1, 1, 2, 2, 3]
        let k = 2
        
        let top = TopKFrequentElements.topKFrequent(nums, k)
        
        let expectedGrouping = [1, 2]
        
        //order isn't important
        for t in top {
            XCTAssertTrue(expectedGrouping.contains(t))
        }
        
        XCTAssertEqual(top.count, expectedGrouping.count)
    }
    
    func test_B() {
        let nums = [1]
        let k = 1
        
        let top = TopKFrequentElements.topKFrequent(nums, k)
        
        let expectedGrouping = [1]
        
        //order isn't important
        for t in top {
            XCTAssertTrue(expectedGrouping.contains(t))
        }
        
        XCTAssertEqual(top.count, expectedGrouping.count)
    }
    
    func test_C() {
        let nums = [-1, -1]
        let k = 1
        
        let top = TopKFrequentElements.topKFrequent(nums, k)
        
        let expectedGrouping = [-1]
        
        //order isn't important
        for t in top {
            XCTAssertTrue(expectedGrouping.contains(t))
        }
        
        XCTAssertEqual(top.count, expectedGrouping.count)
    }
}
