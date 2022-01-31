//
//  KeysAndRoomsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class KeysAndRoomsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let rooms = [[1], [2], [3], []]
        
        let canVisitAll = KeysAndRooms.canVisitAllRooms(rooms)
        
        XCTAssertTrue(canVisitAll)
    }
    
    func test_B() {
        let rooms = [[1, 3], [3, 0, 1], [2], [0]]
        
        let canVisitAll = KeysAndRooms.canVisitAllRooms(rooms)
        
        XCTAssertFalse(canVisitAll)
    }
    
    func test_C() {
        let rooms = [[1], [], [0, 3], [1]]
        
        let canVisitAll = KeysAndRooms.canVisitAllRooms(rooms)
        
        XCTAssertFalse(canVisitAll)
    }
}
