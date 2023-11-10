//
//  RestoreTheArrayFromAdjacentPairsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/11/2023.
//

import XCTest

@testable import LeetCode

final class RestoreTheArrayFromAdjacentPairsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let adjacentPairs = [[2,1],[3,4],[3,2]]
        
        let result = RestoreTheArrayFromAdjacentPairs.restoreArray(adjacentPairs)
        
        XCTAssertEqual(result, [1,2,3,4])
    }
    
    func test_B() {
        let adjacentPairs = [[4,-2],[1,4],[-3,1]]
        
        let result = RestoreTheArrayFromAdjacentPairs.restoreArray(adjacentPairs)
        
        XCTAssertEqual(result, [-2,4,1,-3])
    }
    
    func test_C() {
        let adjacentPairs = [[100000,-100000]]
        
        let result = RestoreTheArrayFromAdjacentPairs.restoreArray(adjacentPairs)
        
        XCTAssertEqual(result, [100000,-100000])
    }
}
