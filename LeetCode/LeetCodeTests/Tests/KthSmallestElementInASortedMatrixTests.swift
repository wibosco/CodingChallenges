// Created 05/08/2025.

import Testing

@testable import LeetCode

struct KthSmallestElementInASortedMatrixTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let matrix = [[1,5,9],[10,11,13],[12,13,15]]
        let k = 8
            
        let result = KthSmallestElementInASortedMatrix().kthSmallest(matrix, k)
        
        #expect(result == 13)
    }
    
    @Test
    func test_B() {
        let matrix = [[-5]]
        let k = 1
            
        let result = KthSmallestElementInASortedMatrix().kthSmallest(matrix, k)
        
        #expect(result == -5)
    }
}
