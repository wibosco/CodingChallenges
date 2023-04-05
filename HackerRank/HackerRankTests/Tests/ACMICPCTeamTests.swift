//
//  ACMICPCTeamTests.swift
//  HackerRankTests
//
//  Created by William Boles on 11/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class ACMICPCTeamTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let contestantsTopicKnowledge = ["10101",
                                         "11100",
                                         "11010",
                                         "00101"]
        
        let bestCombination = ACMICPCTeam.bestCombination(contestantsTopicKnowledge)
        
        XCTAssertEqual(5, bestCombination.maximumTopicsKnown)
        XCTAssertEqual(2, bestCombination.teamsThatCanAchieveThis)
    }
}
