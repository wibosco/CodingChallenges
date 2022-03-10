//
//  PermutationsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/03/2022.
//

import XCTest

@testable import LeetCode

class PermutationsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3]
        
        let permutations = Permutations.permute(nums)
        
        let expectedPermutations = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
        var countOfMatches = 0
        
        //order isn't important
        for permutation in permutations {
            XCTAssertTrue(expectedPermutations.contains(permutation))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedPermutations.count)
    }
    
    func test_B() {
        let nums = [0, 1]
        
        let permutations = Permutations.permute(nums)
        
        let expectedPermutations = [[0, 1], [1, 0]]
        var countOfMatches = 0
        
        //order isn't important
        for permutation in permutations {
            XCTAssertTrue(expectedPermutations.contains(permutation))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedPermutations.count)
    }
    
    func test_C() {
        let nums = [1]
        
        let permutations = Permutations.permute(nums)
        
        let expectedPermutations = [[1]]
        var countOfMatches = 0
        
        //order isn't important
        for permutation in permutations {
            XCTAssertTrue(expectedPermutations.contains(permutation))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedPermutations.count)
    }
}
