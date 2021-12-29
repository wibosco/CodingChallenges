//
//  GroupShiftedStringsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 29/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class GroupShiftedStringsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let strings = ["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"]
        
        let groupings = GroupShiftedStrings.groupStrings(strings)
        
        let expectedGrouping = [["acef"], ["a", "z"], ["abc", "bcd", "xyz"], ["az", "ba"]]
        var countOfMatches = 0
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGrouping.contains(grouping))
            countOfMatches += 1
        }
        
        XCTAssertEqual(expectedGrouping.count, groupings.count)
        XCTAssertEqual(countOfMatches, groupings.count)
    }
    
    func test_B() {
        let strings = ["a"]
        
        let groupings = GroupShiftedStrings.groupStrings(strings)
        
        XCTAssertEqual(groupings, [["a"]])
    }
    
    func test_C() {
        let strings = ["az", "ba"]
        
        let groupings = GroupShiftedStrings.groupStrings(strings)
        
        let expectedGrouping = [["az", "ba"]]
        var countOfMatches = 0
        
        //order isn't important
        for grouping in groupings {
            XCTAssertTrue(expectedGrouping.contains(grouping))
            countOfMatches += 1
        }
        
        XCTAssertEqual(expectedGrouping.count, groupings.count)
        XCTAssertEqual(countOfMatches, groupings.count)
    }

}
