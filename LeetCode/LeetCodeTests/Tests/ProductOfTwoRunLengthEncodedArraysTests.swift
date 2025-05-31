// Created 31/05/2025.

import Testing

@testable import LeetCode

struct ProductOfTwoRunLengthEncodedArraysTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let encoded1 = [[1,3],[2,3]]
        let encoded2 = [[6,3],[3,3]]
            
        let result = ProductOfTwoRunLengthEncodedArrays().findRLEArray(encoded1, encoded2)
        
        #expect(result == [[6,6]])
    }
    
    @Test
    func test_B() {
        let encoded1 = [[1,3],[2,1],[3,2]]
        let encoded2 = [[2,3],[3,3]]
            
        let result = ProductOfTwoRunLengthEncodedArrays().findRLEArray(encoded1, encoded2)
        
        #expect(result == [[2,3],[6,1],[9,2]])
    }
    
    @Test
    func test_C() {
        let encoded1 = [[2,2],[5,5],[1,5],[2,5],[4,2],[5,3],[1,2],[4,3],[3,2],[2,3]]
        let encoded2 = [[1,1],[4,1],[3,3],[5,3],[1,4],[5,1],[4,1],[5,3],[3,5],[2,1],[1,2],[3,1],[2,1],[4,3],[3,1],[2,1]]
            
        let result = ProductOfTwoRunLengthEncodedArrays().findRLEArray(encoded1, encoded2)
        
        #expect(result == [[2,1],[8,1],[15,3],[25,2],[5,1],[1,4],[10,1],[8,1],[10,3],[12,2],[15,3],[2,1],[1,1],[4,1],[12,1],[8,1],[12,2],[8,1],[6,1],[4,1]])
    }
}
