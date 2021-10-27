//
//  MissingNumbersTests.swift
//  CodingChallenges
//
//  Created by William Boles on 12/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class MissingNumbersTests: XCTestCase {
    
    // MARK: Tests
    
    // MARK: Loops
    
    func test_missingNumbersA() {
        let arr = [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
        let brr = [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]
        
        let missing = MissingNumbers.missingNumbers(arr: arr, brr: brr)
        
        XCTAssertEqual([204, 205, 206], missing)
    }
    
    func test_missingNumbersB() {
        let arr = [11, 4, 11, 7, 13, 4, 12, 11, 10, 14]
        let brr = [11, 4, 11, 7, 3, 7, 10, 13, 4, 8, 12, 11, 10, 14, 12]
        
        let missing = MissingNumbers.missingNumbers(arr: arr, brr: brr)
        
        XCTAssertEqual([3, 7, 8, 10, 12], missing)
    }
    
    // MARK: High order functions
    
    func test_missingNumbersAltA() {
        let arr = [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
        let brr = [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]
        
        let missing = MissingNumbers.missingNumbersAlt(arr: arr, brr: brr)
        
        XCTAssertEqual([204, 205, 206], missing)
    }
    
    func test_missingNumbersAltB() {
        let arr = [11, 4, 11, 7, 13, 4, 12, 11, 10, 14]
        let brr = [11, 4, 11, 7, 3, 7, 10, 13, 4, 8, 12, 11, 10, 14, 12]
        
        let missing = MissingNumbers.missingNumbersAlt(arr: arr, brr: brr)
        
        XCTAssertEqual([3, 7, 8, 10, 12], missing)
    }
    
    // MARK: - Performance
    
    func test_missingNumbersA_performance() {
        let arr = [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
        let brr = [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]
        
        self.measure {
            _ = MissingNumbers.missingNumbers(arr: arr, brr: brr)
        }
    }
    
    func test_missingNumbersAltA_performance() {
        let arr = [203, 204, 205, 206, 207, 208, 203, 204, 205, 206]
        let brr = [203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 205, 206, 204]
        
        self.measure {
            _ = MissingNumbers.missingNumbersAlt(arr: arr, brr: brr)
        }
    }
}
