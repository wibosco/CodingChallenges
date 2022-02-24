//
//  CanPlaceFlowersTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 18/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class CanPlaceFlowersTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let flowerbed = [1, 0, 0, 0, 1]
        let n = 1
        
        let canPlace = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertTrue(canPlace)
    }
    
    func test_B() {
        let flowerbed = [1, 0, 0, 0, 1]
        let n = 2
        
        let canPlace = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertFalse(canPlace)
    }
    
    func test_C() {
        let flowerbed = [1, 0, 1, 0, 0]
        let n = 1
        
        let canPlace = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertTrue(canPlace)
    }
    
    func test_D() {
        let flowerbed = [0, 0, 1, 1, 0]
        let n = 1
        
        let canPlace = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertTrue(canPlace)
    }
    
    func test_E() {
        let flowerbed = [1]
        let n = 1
        
        let canPlace = CanPlaceFlowers.canPlaceFlowers(flowerbed, n)
        
        XCTAssertFalse(canPlace)
    }
}