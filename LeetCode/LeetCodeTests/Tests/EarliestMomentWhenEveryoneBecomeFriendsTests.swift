//
//  EarliestMomentWhenEveryoneBecomeFriendsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 30/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class EarliestMomentWhenEveryoneBecomeFriendsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let logs = [[20190101, 0, 1],
                    [20190104, 3, 4],
                    [20190107, 2, 3],
                    [20190211, 1, 5],
                    [20190224, 2, 4],
                    [20190301, 0, 3],
                    [20190312, 1, 2],
                    [20190322, 4, 5]]
        let n = 6
        
        let result = EarliestMomentWhenEveryoneBecomeFriends().earliestAcq(logs, n)
        
        XCTAssertEqual(result, 20190301)
    }
    
    func test_B() {
        let logs = [[0, 2, 0],
                    [1, 0, 1],
                    [3, 0, 3],
                    [4, 1, 2],
                    [7, 3, 1]]
        let n = 4
        
        let result = EarliestMomentWhenEveryoneBecomeFriends().earliestAcq(logs, n)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let logs = [[9, 3, 0],
                    [0, 2, 1],
                    [8, 0, 1],
                    [1, 3, 2],
                    [2, 2, 0],
                    [3, 3, 1]]
        let n = 4
        
        let result = EarliestMomentWhenEveryoneBecomeFriends().earliestAcq(logs, n)
        
        XCTAssertEqual(result, 2)
    }
}
