//
//  FixedPointTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 27/02/2024.
//

import XCTest

@testable import LeetCode

final class AAFixedPointTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let arr = [-10,-5,0,3,7]
        
        let result = FixedPoint().fixedPoint(arr)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let arr = [0,2,5,8,17]
        
        let result = FixedPoint().fixedPoint(arr)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let arr = [-10,-5,3,4,7,9]
        
        let result = FixedPoint().fixedPoint(arr)
        
        XCTAssertEqual(result, -1)
    }
}
