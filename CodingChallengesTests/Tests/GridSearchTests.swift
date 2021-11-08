//
//  GridSearchTests.swift
//  CodingChallenges
//
//  Created by William Boles on 09/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class GridSearchTests: XCTestCase {
    
    // MARK: Tests
    
    func test_A() {
        let grid = ["7283455864",
                    "6731158619",
                    "8988242643",
                    "3830589324",
                    "2229505813",
                    "5633845374",
                    "6473530293",
                    "7053106601",
                    "0834282956",
                    "4607924137"]
        
        let pattern = ["9505",
                       "3845",
                       "3530"]
        
        let containsPattern = GridSearch.gridContainsPattern(grid: grid, pattern: pattern)
        
        XCTAssertTrue(containsPattern)
    }
    
    func test_B() {
        let grid = ["511799789562806",
                    "404007454272504",
                    "549043809916080"]
        
        let pattern = ["99",
                       "99"]
        
        let containsPattern = GridSearch.gridContainsPattern(grid: grid, pattern: pattern)
        
        XCTAssertFalse(containsPattern)
    }
    
    func test_C() {
        let grid = ["1234",
                    "4321",
                    "9999",
                    "9999"]
        
        let pattern = ["12",
                       "21"]
        
        let containsPattern = GridSearch.gridContainsPattern(grid: grid, pattern: pattern)
        
        XCTAssertFalse(containsPattern)
    }
    
    func test_D() {
        let grid = ["123412",
                    "561212",
                    "123634",
                    "781288"]
        
        let pattern = ["12",
                       "34"]
        
        let containsPattern = GridSearch.gridContainsPattern(grid: grid, pattern: pattern)
        
        XCTAssertTrue(containsPattern)
    }
    
    func test_E() {
        let grid = ["999999",
                    "121211"]

        let pattern = ["99",
                       "11"]
        
        let containsPattern = GridSearch.gridContainsPattern(grid: grid, pattern: pattern)
        
        XCTAssertTrue(containsPattern)
    }
    
    func test_F() {
        let grid = ["111111111111111",
                    "111111111111111",
                    "111111011111111",
                    "111111111111111",
                    "111111111111111"]
        
        let pattern = ["11111",
                       "11111",
                       "11110"]
        
        let containsPattern = GridSearch.gridContainsPattern(grid: grid, pattern: pattern)
        
        XCTAssertTrue(containsPattern)
    }
}
