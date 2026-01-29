// Created 11/03/2022.

import XCTest

@testable import LeetCode

final class GroupAnagramsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
        
        let groupings = GroupAnagrams().groupAnagrams(strs)
        
        let expectedGroupings = [["bat"], ["tan", "nat"], ["eat", "tea", "ate"]]
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGroupings.contains(grouping))
        }
        
        XCTAssertEqual(groupings.count, expectedGroupings.count)
    }
    
    func test_B() {
        let strs = [""]
        
        let groupings = GroupAnagrams().groupAnagrams(strs)
        
        let expectedGroupings = [[""]]
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGroupings.contains(grouping))
        }
        
        XCTAssertEqual(groupings.count, expectedGroupings.count)
    }
    
    func test_C() {
        let strs = ["a"]
        
        let groupings = GroupAnagrams().groupAnagrams(strs)
        
        let expectedGroupings = [["a"]]
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGroupings.contains(grouping))
        }
        
        XCTAssertEqual(groupings.count, expectedGroupings.count)
    }
}
