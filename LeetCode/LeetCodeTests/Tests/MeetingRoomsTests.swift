//
//  MeetingRoomsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 28/03/2022.
//

import XCTest

@testable import LeetCode

class MeetingRoomsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let intervals = [[0, 30], [5, 10], [15, 20]]
        
        let attendAll = MeetingRooms.canAttendMeetings(intervals)
        
        XCTAssertFalse(attendAll)
    }
    
    func test_B() {
        let intervals = [[7, 10], [2, 4]]
        
        let attendAll = MeetingRooms.canAttendMeetings(intervals)
        
        XCTAssertTrue(attendAll)
    }
    
    func test_C() {
        let intervals = [[Int]]()
        
        let attendAll = MeetingRooms.canAttendMeetings(intervals)
        
        XCTAssertTrue(attendAll)
    }
    
    func test_D() {
        let intervals = [[7, 10]]
        
        let attendAll = MeetingRooms.canAttendMeetings(intervals)
        
        XCTAssertTrue(attendAll)
    }
}
