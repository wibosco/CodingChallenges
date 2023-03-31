//
//  MaximumSubarrayTests.swift
//  HackerRankTests
//
//  Created by William Boles on 10/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class MaximumSubarrayTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let array = [1,2,3,4]
        
        let maximums = MaximumSubarray.maximumTotals(array: array)
        
        XCTAssertEqual(maximums.contiguousTotal, 10)
        XCTAssertEqual(maximums.nonContiguousTotal, 10)
    }
    
    func test_B() {
        let array = [2,-1,2,3,4,-5]
        
        let maximums = MaximumSubarray.maximumTotals(array: array)
        
        XCTAssertEqual(maximums.contiguousTotal, 10)
        XCTAssertEqual(maximums.nonContiguousTotal, 11)
    }
    
    func test_C() {
        let array = [1]
        
        let maximums = MaximumSubarray.maximumTotals(array: array)
        
        XCTAssertEqual(maximums.contiguousTotal, 1)
        XCTAssertEqual(maximums.nonContiguousTotal, 1)
    }
    
    func test_D() {
        let array = [-1,-2,-3,-4,-5,-6]
        
        let maximums = MaximumSubarray.maximumTotals(array: array)
        
        XCTAssertEqual(maximums.contiguousTotal, -1)
        XCTAssertEqual(maximums.nonContiguousTotal, -1)
    }
    
    func test_E() {
        let array = [1, -2]
        
        let maximums = MaximumSubarray.maximumTotals(array: array)
        
        XCTAssertEqual(maximums.contiguousTotal, 1)
        XCTAssertEqual(maximums.nonContiguousTotal, 1)
    }
    
    func test_F() {
        let array = [1, 2, 3]
        
        let maximums = MaximumSubarray.maximumTotals(array: array)
        
        XCTAssertEqual(maximums.contiguousTotal, 6)
        XCTAssertEqual(maximums.nonContiguousTotal, 6)
    }
    
    func test_G() {
        let array = [-10]
        
        let maximums = MaximumSubarray.maximumTotals(array: array)
        
        XCTAssertEqual(maximums.contiguousTotal, -10)
        XCTAssertEqual(maximums.nonContiguousTotal, -10)
    }
    
    func test_H() {
        let array = [1, -1, -1, -1, -1, 5]
        
        let maximums = MaximumSubarray.maximumTotals(array: array)
        
        XCTAssertEqual(maximums.contiguousTotal, 5)
        XCTAssertEqual(maximums.nonContiguousTotal, 6)
    }
    
    func test_I() {
        let array = [-2, -3, 4, -1, -2, 1, 5, -3]
        
        let maximums = MaximumSubarray.maximumTotals(array: array)
        
        XCTAssertEqual(maximums.contiguousTotal, 7)
        XCTAssertEqual(maximums.nonContiguousTotal, 10)
    }
    
}
