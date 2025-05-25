// Created 25/05/2025.

import Testing

@testable import LeetCode

struct CarPoolingTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let trips = [[2,1,5],[3,3,7]]
        let capacity = 4
            
        let result = CarPooling().carPooling(trips, capacity)
        
        #expect(result == false)
    }
    
    @Test
    func test_B() {
        let trips = [[2,1,5],[3,3,7]]
        let capacity = 5
            
        let result = CarPooling().carPooling(trips, capacity)
        
        #expect(result == true)
    }
    
    @Test
    func test_C() {
        let trips = [[9,3,6],[8,1,7],[6,6,8],[8,4,9],[4,2,9]]
        let capacity = 28
            
        let result = CarPooling().carPooling(trips, capacity)
        
        #expect(result == false)
    }
    
    @Test
    func test_D() {
        let trips = [[9,3,4],[9,1,7],[4,2,4],[7,4,5]]
        let capacity = 23
            
        let result = CarPooling().carPooling(trips, capacity)
        
        #expect(result == true)
    }
}
