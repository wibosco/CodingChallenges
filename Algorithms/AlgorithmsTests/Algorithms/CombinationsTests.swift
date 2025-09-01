// Created 01/09/2025.

import Testing

@testable import Algorithms

struct CombinationsTests {

    // MARK: - Tests
    
    // MARK: Generation
    
    @Test
    func test_generation_A() {
        let arr = [1,2,3]
        
        let result = Combinations().generateCombinations(arr)
        
        #expect(result.count == 7)

        #expect(result[0] == [1])
        #expect(result[1] == [1,2])
        #expect(result[2] == [1,2,3])
        #expect(result[3] == [1,3])
        #expect(result[4] == [2])
        #expect(result[5] == [2,3])
        #expect(result[6] == [3])
    }
    
    // MARK: Count
    
    @Test
    func test_count_A() {
        let arr = [1,2,3]
        
        let result = Combinations().countCombinations(arr)
        
        #expect(result == 7)
    }
}
