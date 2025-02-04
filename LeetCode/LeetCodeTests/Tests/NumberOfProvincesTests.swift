//
//  NumberOfProvincesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 29/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class NumberOfProvincesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let isConnected = [[1, 1, 0],
                           [1, 1, 0],
                           [0, 0, 1]]
        
        let result = NumberOfProvinces().findCircleNum(isConnected)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let isConnected = [[1, 0, 0],
                           [0, 1, 0],
                           [0, 0, 1]]
        
        let result = NumberOfProvinces().findCircleNum(isConnected)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let isConnected =
        
        //0  1  2  3  4  5  6  7  8  9 10 11 12 13  14
        [[1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0], //0
         [0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0], //1
         [0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1], //2
         [0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0], //3
         [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0], //4
         [0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0], //5
         [0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0], //6
         [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0], //7
         [1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0], //8
         [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0], //9
         [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0], //10
         [0, 0, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0], //11
         [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1], //12
         [0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0], //13
         [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1]] //14
        
        let result = NumberOfProvinces().findCircleNum(isConnected)
        
        XCTAssertEqual(result, 3)
    }
    
}
