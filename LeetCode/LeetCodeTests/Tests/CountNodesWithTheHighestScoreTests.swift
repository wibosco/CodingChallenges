//
//  AACountNodesWithTheHighestScoreTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/02/2024.
//

import XCTest

@testable import LeetCode

final class CountNodesWithTheHighestScoreTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let parents = [-1,2,0,2,0]
        
        let result = CountNodesWithTheHighestScore().countHighestScoreNodes(parents)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let parents = [-1,2,0]
        
        let result = CountNodesWithTheHighestScore().countHighestScoreNodes(parents)
        
        XCTAssertEqual(result, 2)
    }
}
