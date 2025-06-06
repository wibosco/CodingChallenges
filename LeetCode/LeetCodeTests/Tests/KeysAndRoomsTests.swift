//
//  KeysAndRoomsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class KeysAndRoomsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let rooms = [[1], [2], [3], []]
        
        let result = KeysAndRooms().canVisitAllRooms(rooms)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let rooms = [[1, 3], [3, 0, 1], [2], [0]]
        
        let result = KeysAndRooms().canVisitAllRooms(rooms)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let rooms = [[1], [], [0, 3], [1]]
        
        let result = KeysAndRooms().canVisitAllRooms(rooms)
        
        XCTAssertFalse(result)
    }
}
