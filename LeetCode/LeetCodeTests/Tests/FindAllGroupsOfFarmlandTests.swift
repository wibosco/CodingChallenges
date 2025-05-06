// Created 06/05/2025.

import Testing

@testable import LeetCode

struct FindAllGroupsOfFarmlandTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let land = [[1,0,0],
                    [0,1,1],
                    [0,1,1]]
        
        let result = FindAllGroupsOfFarmland().findFarmland(land)
        
        #expect(result == [[0,0,0,0],[1,1,2,2]])
    }
    
    @Test
    func test_B() {
        let land = [[1,1],[1,1]]
        
        let result = FindAllGroupsOfFarmland().findFarmland(land)
        
        #expect(result == [[0,0,1,1]])
    }
    
    @Test
    func test_C() {
        let land = [[0]]
        
        let result = FindAllGroupsOfFarmland().findFarmland(land)
        
        #expect(result == [])
    }
    
    @Test
    func test_D() {
        let land = [[1,1],[0,0]]
        
        let result = FindAllGroupsOfFarmland().findFarmland(land)
        
        #expect(result == [[0,0,0,1]])
    }
}
