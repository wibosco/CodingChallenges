// Created 30/10/2023.


import XCTest

@testable import LeetCode

final class AsFarFromLandAsPossibleTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let grid = [[1,0,1],
                    [0,0,0],
                    [1,0,1]]
        
        let result = AsFarFromLandAsPossible().maxDistance(grid)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let grid = [[1,0,0],
                    [0,0,0],
                    [0,0,0]]
        
        let result = AsFarFromLandAsPossible().maxDistance(grid)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let grid = [[0,0,0],
                    [0,0,0],
                    [0,0,0]]
        
        let result = AsFarFromLandAsPossible().maxDistance(grid)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_D() {
        let grid = [[1,1,1],
                    [1,1,1],
                    [1,1,1]]
        
        let result = AsFarFromLandAsPossible().maxDistance(grid)
        
        XCTAssertEqual(result, -1)
    }
}
