//
//  ContainerWithMostWaterTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ContainerWithMostWaterTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
        
        let result = ContainerWithMostWater().maxArea(height)
        
        XCTAssertEqual(result, 49)
    }
    
    func test_B() {
        let height = [1, 1]
        
        let result = ContainerWithMostWater().maxArea(height)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let height = [4, 3, 2, 1, 4]
        
        let result = ContainerWithMostWater().maxArea(height)
        
        XCTAssertEqual(result, 16)
    }
    
    func test_D() {
        let height = [1, 2, 1]
        
        let result = ContainerWithMostWater().maxArea(height)
        
        XCTAssertEqual(result, 2)
    }
    
}
