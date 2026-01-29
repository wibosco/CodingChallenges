// Created 29/12/2021.

import XCTest

@testable import LeetCode

final class GroupShiftedStringsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let strings = ["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"]
        
        let groupings = GroupShiftedStrings().groupStrings(strings)
        
        let expectedGrouping = [["acef"], ["a", "z"], ["abc", "bcd", "xyz"], ["az", "ba"]]
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGrouping.contains(grouping))
        }
        
        XCTAssertEqual(expectedGrouping.count, groupings.count)
    }
    
    func test_B() {
        let strings = ["a"]
        
        let groupings = GroupShiftedStrings().groupStrings(strings)
        
        XCTAssertEqual(groupings, [["a"]])
    }
    
    func test_C() {
        let strings = ["az", "ba"]
        
        let groupings = GroupShiftedStrings().groupStrings(strings)
        
        let expectedGrouping = [["az", "ba"]]
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGrouping.contains(grouping))
        }
        
        XCTAssertEqual(expectedGrouping.count, groupings.count)
    }
}
