//
//  SqrtTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 17/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class SqrtTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let x = 4
        
        let sqrt = Sqrt.mySqrt(x)
        
        XCTAssertEqual(sqrt, 2)
    }
    
    func test_B() {
        let x = 8
        
        let sqrt = Sqrt.mySqrt(x)
        
        XCTAssertEqual(sqrt, 2)
    }
    
    func test_C() {
        let x = 0
        
        let sqrt = Sqrt.mySqrt(x)
        
        XCTAssertEqual(sqrt, 0)
    }
    
    func test_D() {
        let x = 1
        
        let sqrt = Sqrt.mySqrt(x)
        
        XCTAssertEqual(sqrt, 1)
    }
    
    func test_E() {
        let x = 2
        
        let sqrt = Sqrt.mySqrt(x)
        
        XCTAssertEqual(sqrt, 1)
    }
}
