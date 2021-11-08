//
//  CompareTheTripletsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 03/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class CompareTheTripletsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let a = [1, 2, 3]
        let b = [3, 2, 1]
        
        let score = CompareTheTriplets.score(a: a, b: b)
        
        XCTAssertEqual([1, 1], score)
    }
    
    func test_B() {
        let a = [5, 6, 7]
        let b = [3, 6, 10]
        
        let score = CompareTheTriplets.score(a: a, b: b)
        
        XCTAssertEqual([1, 1], score)
    }
    
    func test_C() {
        let a = [17, 28, 30]
        let b = [99, 16, 8]
        
        let score = CompareTheTriplets.score(a: a, b: b)
        
        XCTAssertEqual([2, 1], score)
    }
}
