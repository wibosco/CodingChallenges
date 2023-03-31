//
//  FindKClosestElementsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 18/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FindKClosestElementsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let arr = [1, 2, 3, 4, 5]
        let k = 4
        let x = 3
        
        let closet = FindKClosestElements.findClosestElements(arr, k, x)
        
        XCTAssertEqual(closet, [1, 2, 3, 4])
    }
    
    func test_B() {
        let arr = [1, 2, 3, 4, 5]
        let k = 4
        let x = -1
        
        let closet = FindKClosestElements.findClosestElements(arr, k, x)
        
        XCTAssertEqual(closet, [1, 2, 3, 4])
    }
    
    func test_C() {
        let arr = [1, 1, 1, 10, 10, 10]
        let k = 1
        let x = 9
        
        let closet = FindKClosestElements.findClosestElements(arr, k, x)
        
        XCTAssertEqual(closet, [10])
    }
    
    func test_D() {
        let arr = [0, 0, 0, 1, 3, 5, 6, 7, 8, 8]
        let k = 2
        let x = 2
        
        let closet = FindKClosestElements.findClosestElements(arr, k, x)
        
        XCTAssertEqual(closet, [1, 3])
    }
    
    func test_E() {
        let arr = [0, 0, 1, 2, 3, 3, 4, 7, 7, 8]
        let k = 3
        let x = 5
        
        let closet = FindKClosestElements.findClosestElements(arr, k, x)
        
        XCTAssertEqual(closet, [3, 3, 4])
    }
}
