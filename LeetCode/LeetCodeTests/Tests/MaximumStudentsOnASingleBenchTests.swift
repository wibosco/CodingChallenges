// Created 17/01/2026.

import Testing

@testable import LeetCode

struct MaximumStudentsOnASingleBenchTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let students = [[1,2],[2,2],[3,3],[1,3],[2,3]]
        
        let result = MaximumStudentsOnASingleBench().maxStudentsOnBench(students)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let students = [[1,1],[2,1],[3,1],[4,2],[5,2]]
        
        let result = MaximumStudentsOnASingleBench().maxStudentsOnBench(students)
        
        #expect(result == 3)
    }
    
    @Test
    func test_C() {
        let students = [[1,1],[1,1]]
        
        let result = MaximumStudentsOnASingleBench().maxStudentsOnBench(students)
        
        #expect(result == 1)
    }
    
    @Test
    func test_D() {
        let students = [[Int]]()
        
        let result = MaximumStudentsOnASingleBench().maxStudentsOnBench(students)
        
        #expect(result == 0)
    }
}
