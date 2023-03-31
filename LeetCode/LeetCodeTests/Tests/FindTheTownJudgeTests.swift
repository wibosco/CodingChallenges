//
//  FindTheTownJudgeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class FindTheTownJudgeTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 2
        let trust = [[1, 2]]
        
        let judge = FindTheTownJudge.findJudge(n, trust)
        
        XCTAssertEqual(judge, 2)
    }
    
    func test_B() {
        let n = 3
        let trust = [[1, 3],
                     [2, 3]]
        
        let judge = FindTheTownJudge.findJudge(n, trust)
        
        XCTAssertEqual(judge, 3)
    }
    
    func test_C() {
        let n = 3
        let trust = [[1, 3],
                     [2, 3],
                     [3, 1]]
        
        let judge = FindTheTownJudge.findJudge(n, trust)
        
        XCTAssertEqual(judge, -1)
    }
    
    func test_D() {
        let n = 3
        let trust = [[1, 2],
                     [2, 3]]
        
        let judge = FindTheTownJudge.findJudge(n, trust)
        
        XCTAssertEqual(judge, -1)
    }
}
