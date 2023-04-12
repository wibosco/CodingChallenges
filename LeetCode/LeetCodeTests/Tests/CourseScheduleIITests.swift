//
//  CourseScheduleIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class CourseScheduleIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let numCourses = 2
        let prerequisites = [[1, 0]]
        
        let result = CourseScheduleII.findOrder(numCourses, prerequisites)
        
        let expectedResult = [0, 1]
        
        //order isn't important
        for r in result {
            XCTAssertTrue(expectedResult.contains(r))
        }
        
        XCTAssertEqual(result.count, expectedResult.count)
    }
    
    func test_B() {
        let numCourses = 4
        let prerequisites = [[1, 0],
                             [2, 0],
                             [3, 1],
                             [3, 2]]
        
        let result = CourseScheduleII.findOrder(numCourses, prerequisites)
        
        let expectedResult = [0, 1, 2, 3]
        
        //order isn't important
        for r in result {
            XCTAssertTrue(expectedResult.contains(r))
        }
        
        XCTAssertEqual(result.count, expectedResult.count)
    }
    
    func test_C() {
        let numCourses = 1
        let prerequisites = [[Int]]()
        
        let result = CourseScheduleII.findOrder(numCourses, prerequisites)
        
        XCTAssertEqual(result, [0])
    }
    
    func test_D() {
        let numCourses = 3
        let prerequisites = [[1, 0],
                             [1, 2],
                             [0, 1]]
        
        let result = CourseScheduleII.findOrder(numCourses, prerequisites)
        
        XCTAssertEqual(result, [])
    }
}
