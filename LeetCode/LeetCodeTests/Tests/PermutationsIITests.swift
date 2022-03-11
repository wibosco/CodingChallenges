//
//  PermutationsIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/03/2022.
//

import XCTest

@testable import LeetCode

class PermutationsIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 1, 2]
        
        let permutations = PermutationsII.permuteUnique(nums)
        
        let expectedPermutations = [[1, 1, 2], [1, 2, 1], [2, 1, 1]]
        var countOfMatches = 0
        
        //order isn't important
        for permutation in permutations {
            XCTAssertTrue(expectedPermutations.contains(permutation))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedPermutations.count)
    }
    
    func test_B() {
        let nums = [1, 2, 3]
        
        let permutations = PermutationsII.permuteUnique(nums)
        
        let expectedPermutations = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
        var countOfMatches = 0
        
        //order isn't important
        for permutation in permutations {
            XCTAssertTrue(expectedPermutations.contains(permutation))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedPermutations.count)
    }
}
