// Created 01/09/2025.

import Testing

@testable import Algorithms

struct KadaneTests {

    // MARK: - Tests
    
    // MARK: Max
    
    @Test
    func test_max_A() {
        let array = [-2,1,-3,4,-1,2,1,-5,4]
        
        let result = Kadane().maxSubarray(array)
        
        #expect(result == 6)
    }
    
    @Test
    func test_max_B() {
        let array = [1]
        
        let result = Kadane().maxSubarray(array)
        
        #expect(result == 1)
    }
    
    @Test
    func test_max_C() {
        let array = [5,4,-1,7,8]
        
        let result = Kadane().maxSubarray(array)
        
        #expect(result == 23)
    }
    
    @Test
    func test_max_D() {
        let array = [1,2,3]
        
        let result = Kadane().maxSubarray(array)
        
        #expect(result == 6)
    }
    
    // MARK: Min
    
    @Test
    func test_min_A() {
        let array = [-2,1,-3,4,-1,2,1,-5,4]
        
        let result = Kadane().minSubarray(array)
        
        #expect(result == -5)
    }
    
    @Test
    func test_min_B() {
        let array = [1]
        
        let result = Kadane().minSubarray(array)
        
        #expect(result == 1)
    }
    
    @Test
    func test_min_C() {
        let array = [5,4,-1,7,8]
        
        let result = Kadane().minSubarray(array)
        
        #expect(result == -1)
    }
    
    @Test
    func test_min_D() {
        let array = [1,2,3]
        
        let result = Kadane().minSubarray(array)
        
        #expect(result == 1)
    }
    
    @Test
    func test_min_E() {
        let array = [1,-2,-3]
        
        let result = Kadane().minSubarray(array)
        
        #expect(result == -5)
    }

}
