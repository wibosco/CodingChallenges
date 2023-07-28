//
//  BaseballGameTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/07/2023.
//

import XCTest

@testable import LeetCode

final class BaseballGameTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let ops = ["5", "2", "C", "D", "+"]
            
        let result = BaseballGame.calPoints(ops)
        
        XCTAssertEqual(result, 30)
    }
    
    func test_B() {
        let ops = ["5", "-2", "4", "C", "D", "9", "+", "+"]
            
        let result = BaseballGame.calPoints(ops)
        
        XCTAssertEqual(result, 27)
    }
    
    func test_C() {
        let ops =  ["1", "C"]
            
        let result = BaseballGame.calPoints(ops)
        
        XCTAssertEqual(result, 0)
    }
}
