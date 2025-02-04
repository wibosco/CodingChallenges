//
//  ReorderRoutesToMakeAllPathsLeadToTheCityZeroTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 25/10/2023.
//

import XCTest

@testable import LeetCode

final class ReorderRoutesToMakeAllPathsLeadToTheCityZeroTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let n = 6
        let connections = [[0, 1], [1, 3], [2, 3], [4, 0], [4, 5]]
        
        let result = ReorderRoutesToMakeAllPathsLeadToTheCityZero().minReorder(n, connections)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let n = 5
        let connections = [[1, 0], [1, 2], [3, 2], [3, 4]]
        
        let result = ReorderRoutesToMakeAllPathsLeadToTheCityZero().minReorder(n, connections)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let n = 3
        let connections = [[1, 0], [2, 0]]
        
        let result = ReorderRoutesToMakeAllPathsLeadToTheCityZero().minReorder(n, connections)
        
        XCTAssertEqual(result, 0)
    }
}
