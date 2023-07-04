//
//  resultFlowersTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 18/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class CanPlaceFlowersTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let flowerbed = [1, 0, 0, 0, 1]
        let n = 1
        
        let result = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let flowerbed = [1, 0, 0, 0, 1]
        let n = 2
        
        let result = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let flowerbed = [1, 0, 1, 0, 0]
        let n = 1
        
        let result = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let flowerbed = [0, 0, 1, 1, 0]
        let n = 1
        
        let result = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertTrue(result)
    }
    
    func test_E() {
        let flowerbed = [1]
        let n = 1
        
        let result = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertFalse(result)
    }
}
