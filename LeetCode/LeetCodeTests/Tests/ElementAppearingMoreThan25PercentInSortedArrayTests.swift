// Created 30/07/2025.

import Testing

@testable import LeetCode

struct ElementAppearingMoreThan25PercentInSortedArrayTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let arr = [1,2,2,6,6,6,6,7,10]
        
        let result = ElementAppearingMoreThan25PercentInSortedArray().findSpecialInteger(arr)
        
        #expect(result == 6)
    }
    
    @Test
    func test_B() {
        let arr = [1,1]
        
        let result = ElementAppearingMoreThan25PercentInSortedArray().findSpecialInteger(arr)
        
        #expect(result == 1)
    }
    
    @Test
    func test_C() {
        let arr = [1,2,3,4,5,6,7,8,9,10,11,12,12,12,12]
        
        let result = ElementAppearingMoreThan25PercentInSortedArray().findSpecialInteger(arr)
        
        #expect(result == 12)
    }
    
    @Test
    func test_D() {
        let arr = [15,15,21,21,32,32,33,33,33,34,35]
        
        let result = ElementAppearingMoreThan25PercentInSortedArray().findSpecialInteger(arr)
        
        #expect(result == 33)
    }
}
