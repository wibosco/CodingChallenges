// Created 12/04/2023.


import XCTest

@testable import LeetCode

final class CourseScheduleTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let numCourses = 2
        let prerequisites = [[1,0]]
        
        let result = CourseSchedule().canFinish(numCourses, prerequisites)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let numCourses = 2
        let prerequisites = [[1,0],
                             [0,1]]
        
        let result = CourseSchedule().canFinish(numCourses, prerequisites)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let numCourses = 5
        let prerequisites = [[1,4],
                             [2,4],
                             [3,1],
                             [3,2]]
        
        let result = CourseSchedule().canFinish(numCourses, prerequisites)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let numCourses = 8
        let prerequisites = [[1,0],
                             [2,6],
                             [1,7],
                             [6,4],
                             [7,0],
                             [0,5]]
        
        let result = CourseSchedule().canFinish(numCourses, prerequisites)
        
        XCTAssertTrue(result)
    }
}
