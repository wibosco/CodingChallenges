// Created 28/03/2022.

import XCTest

@testable import LeetCode

final class MeetingRoomsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let intervals = [[0, 30], [5, 10], [15, 20]]
        
        let result = MeetingRooms().canAttendMeetings(intervals)
        
        XCTAssertFalse(result)
    }
    
    func test_B() {
        let intervals = [[7, 10], [2, 4]]
        
        let result = MeetingRooms().canAttendMeetings(intervals)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let intervals = [[Int]]()
        
        let result = MeetingRooms().canAttendMeetings(intervals)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let intervals = [[7, 10]]
        
        let result = MeetingRooms().canAttendMeetings(intervals)
        
        XCTAssertTrue(result)
    }
}
