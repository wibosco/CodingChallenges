// Created 12/05/2025.

import Testing

@testable import LeetCode

struct NumberOfStudentsUnableToEatLunchTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let students = [1,1,0,0]
        let sandwiches = [0,1,0,1]
            
        let result = NumberOfStudentsUnableToEatLunch().countStudents(students, sandwiches)
        
        #expect(result == 0)
    }
    
    @Test
    func test_B() {
        let students = [1,1,1,0,0,1]
        let sandwiches = [1,0,0,0,1,1]
            
        let result = NumberOfStudentsUnableToEatLunch().countStudents(students, sandwiches)
        
        #expect(result == 3)
    }
}
