// Created 04/12/2025.

import Testing

@testable import LeetCode

struct CountCollisionsOnARoadTests {
    
    // MARK: - Tests
    
    @Test
    func test_A() {
        let directions = "RLRSLL"
        let result = CountCollisionsOnARoad().countCollisions(directions)
        
        #expect(result == 5)
    }
    
    @Test
    func test_B() {
        let directions = "LLRR"
        let result = CountCollisionsOnARoad().countCollisions(directions)
        
        #expect(result == 0)
    }
    
    @Test
    func test_C() {
        let directions = "LSSSLLSSSSLRRSLLLSLSLRRLLLLLRSSRSRRSLLLSSS"
        let result = CountCollisionsOnARoad().countCollisions(directions)
        
        #expect(result == 24)
    }
}
