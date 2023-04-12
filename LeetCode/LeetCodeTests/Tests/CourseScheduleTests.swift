//
//  CourseScheduleTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 12/04/2023.
//

import XCTest

@testable import LeetCode

final class CourseScheduleTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let numCourses = 2
        let prerequisites = [[1, 0]]
        
        let result = CourseSchedule.canFinish(numCourses, prerequisites)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let numCourses = 2
        let prerequisites = [[1, 0],
                             [0, 1]]
        
        let result = CourseSchedule.canFinish(numCourses, prerequisites)
        
        XCTAssertFalse(result)
    }
}
