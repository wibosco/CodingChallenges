//
//  GroupAnagramsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/03/2022.
//

import XCTest

@testable import LeetCode

class GroupAnagramsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
        
        let groupings = GroupAnagrams.groupAnagrams(strs)
        
        let expectedGroupings = [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]
        var countOfMatches = 0
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGroupings.contains(grouping))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedGroupings.count)
    }
    
    func test_B() {
        let strs = [""]
        
        let groupings = GroupAnagrams.groupAnagrams(strs)
        
        let expectedGroupings = [[""]]
        var countOfMatches = 0
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGroupings.contains(grouping))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedGroupings.count)
    }
    
    func test_C() {
        let strs = ["a"]
        
        let groupings = GroupAnagrams.groupAnagrams(strs)
        
        let expectedGroupings = [["a"]]
        var countOfMatches = 0
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGroupings.contains(grouping))
            countOfMatches += 1
        }
        
        XCTAssertEqual(countOfMatches, expectedGroupings.count)
    }
}
