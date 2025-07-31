// Created 13/05/2025.

import Testing

@testable import LeetCode

struct BeautifulTowersITests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let heights = [5,3,4,1,1]
        
        let result = BeautifulTowersI().maximumSumOfHeights(heights)
        
        #expect(result == 13)
    }
    
    @Test
    func test_B() {
        let heights = [6,5,3,9,2,7]
        
        let result = BeautifulTowersI().maximumSumOfHeights(heights)
        
        #expect(result == 22)
    }
    
    @Test
    func test_C() {
        let heights = [3,2,5,5,2,3]
        
        let result = BeautifulTowersI().maximumSumOfHeights(heights)
        
        #expect(result == 18)
    }
}
