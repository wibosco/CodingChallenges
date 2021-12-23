//
//  CourseScheduleIITests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class CourseScheduleIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let numCourses = 2
        let prerequisites = [[1, 0]]
        
        let path = CourseScheduleII.findOrder(numCourses, prerequisites)
        
        XCTAssertEqual(path, [0, 1])
    }
    
    func test_B() {
        let numCourses = 4
        let prerequisites = [[1, 0],
                             [2, 0],
                             [3, 1],
                             [3, 2]]
        
        let path = CourseScheduleII.findOrder(numCourses, prerequisites)
        
        XCTAssertEqual(path, [0, 1, 2, 3])
    }
    
    func test_C() {
        let numCourses = 1
        let prerequisites = [[Int]]()
        
        let path = CourseScheduleII.findOrder(numCourses, prerequisites)
        
        XCTAssertEqual(path, [0])
    }
    
    func test_D() {
        let numCourses = 3
        let prerequisites = [[1, 0],
                             [1, 2],
                             [0, 1]]
        
        let path = CourseScheduleII.findOrder(numCourses, prerequisites)
        
        XCTAssertEqual(path, [])
    }
}
