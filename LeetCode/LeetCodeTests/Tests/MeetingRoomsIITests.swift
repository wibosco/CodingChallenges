//
//  MeetingRoomsIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 27/03/2022.
//

import XCTest
@testable import LeetCode

class MeetingRoomsIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let intervals = [[0, 30], [5, 10], [15, 20]]
        
        let rooms = MeetingRoomsII.minMeetingRooms(intervals)
        
        XCTAssertEqual(rooms, 2)
    }
    
    func test_B() {
        let intervals = [[7, 10], [2, 4]]
        
        let rooms = MeetingRoomsII.minMeetingRooms(intervals)
        
        XCTAssertEqual(rooms, 1)
    }
    
    func test_C() {
        let intervals = [[5, 8], [6, 8]]
        
        let rooms = MeetingRoomsII.minMeetingRooms(intervals)
        
        XCTAssertEqual(rooms, 2)
    }
    
    func test_D() {
        let intervals = [[6, 17], [8, 9], [11, 12], [6, 9]]
        
        let rooms = MeetingRoomsII.minMeetingRooms(intervals)
        
        XCTAssertEqual(rooms, 3)
    }
    
    func test_E() {
        let intervals = [[13, 15], [1, 13]]
        
        let rooms = MeetingRoomsII.minMeetingRooms(intervals)
        
        XCTAssertEqual(rooms, 1)
    }
}
