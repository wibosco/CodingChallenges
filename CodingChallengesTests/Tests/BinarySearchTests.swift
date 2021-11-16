//
//  BinarySearchTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 16/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class BinarySearchTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums = [0, 1, 2, 3, 4, 5]
        let target = 4
        
        let index = BinarySearch.find(target, in: nums)
        
        XCTAssertEqual(index, 4)
    }
    
    func test_B() {
        let nums = [0, 1, 2, 3, 4, 5]
        let target = 1
        
        let index = BinarySearch.find(target, in: nums)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_C() {
        let nums = [Int]()
        let target = 1
        
        let index = BinarySearch.find(target, in: nums)
        
        XCTAssertEqual(index, -1)
    }
    
    func test_D() {
        let nums = [1]
        let target = 1
        
        let index = BinarySearch.find(target, in: nums)
        
        XCTAssertEqual(index, 0)
    }
    
    func test_E() {
        let nums = [1]
        let target = 4
        
        let index = BinarySearch.find(target, in: nums)
        
        XCTAssertEqual(index, -1)
    }
    
    func test_F() {
        let nums = [1, 4, 7, 19, 22, 101]
        let target = 87
        
        let index = BinarySearch.find(target, in: nums)
        
        XCTAssertEqual(index, -1)
    }
    
    func test_GG() {
        let nums = [1, 4, 7, 19, 22, 101]
        let target = 19
        
        let index = BinarySearch.find(target, in: nums)
        
        XCTAssertEqual(index, 3)
    }
}
