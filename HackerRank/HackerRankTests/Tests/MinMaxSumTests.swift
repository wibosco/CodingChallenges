//
//  MinMaxSumTests.swift
//  HackerRankTests
//
//  Created by William Boles on 27/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class MinMaxSumTests: XCTestCase {

    // MARK: - Tests
    
    // MARK: Loop
    
    func test_A() {
        let data: [UInt] = [1, 3, 5, 7, 9]
        let (minSum, maxSum) = MinMaxSum.minMaxSum(data)
        
        XCTAssertEqual(16, minSum)
        XCTAssertEqual(24, maxSum)
    }
    
    func test_B() {
        let data: [UInt] = [1, 2, 3, 4, 5]
        let (minSum, maxSum) = MinMaxSum.minMaxSum(data)
        
        XCTAssertEqual(10, minSum)
        XCTAssertEqual(14, maxSum)
    }
    
    func test_C() {
        let data: [UInt] = [7, 69, 2, 221, 8974]
        let (minSum, maxSum) = MinMaxSum.minMaxSum(data)
        
        XCTAssertEqual(299, minSum)
        XCTAssertEqual(9271, maxSum)
    }
    
    // MARK: Performance
    
    func test_performance() {
        let data: [UInt] = [1, 3, 5, 7, 9]
        
        self.measure {
            _ = MinMaxSum.minMaxSum(data)
        }
    }
    
    func test_alt_performance() {
        let data: [UInt] = [1, 3, 5, 7, 9]
        
        self.measure {
            _ = MinMaxSum.minMaxSumAlt(data)
        }
    }
}
