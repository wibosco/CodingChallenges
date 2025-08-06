// Created 06/08/2025.

import Testing

@testable import LeetCode

struct DiagonalTraverseIITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let nums = [[1,2,3],[4,5,6],[7,8,9]]
        
        let result = DiagonalTraverseII().findDiagonalOrder(nums)
        
        #expect(result == [1,4,2,7,5,3,8,6,9])
    }
    
    @Test
    func test_B() {
        let nums = [[1,2,3,4,5],[6,7],[8],[9,10,11],[12,13,14,15,16]]
        
        let result = DiagonalTraverseII().findDiagonalOrder(nums)
        
        #expect(result == [1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16])
    }
}
