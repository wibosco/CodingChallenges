// Created 12/12/2021.

import XCTest

@testable import LeetCode

final class WallsAndGatesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        var rooms = [[2147483647, -1, 0, 2147483647],
                     [2147483647, 2147483647, 2147483647, -1],
                     [2147483647, -1, 2147483647, -1],
                     [0, -1, 2147483647, 2147483647]]
        
        WallsAndGates().wallsAndGates(&rooms)
        
        XCTAssertEqual(rooms, [[3, -1, 0, 1],
                               [2, 2, 1, -1],
                               [1, -1, 2, -1],
                               [0, -1, 3, 4]])
    }
    
    func test_B() {
        var rooms = [[-1]]
        
        WallsAndGates().wallsAndGates(&rooms)
        
        XCTAssertEqual(rooms, [[-1]])
    }
    
    func test_C() {
        var rooms = [[2147483647]]
        
        WallsAndGates().wallsAndGates(&rooms)
        
        XCTAssertEqual(rooms, [[2147483647]])
    }
    
    func test_D() {
        var rooms = [[0]]
        
        WallsAndGates().wallsAndGates(&rooms)
        
        XCTAssertEqual(rooms, [[0]])
    }
    
    func test_E() {
        var rooms = [[2147483647, 0, 2147483647, 2147483647, 0, 2147483647, -1, 2147483647]]
        
        WallsAndGates().wallsAndGates(&rooms)
        
        XCTAssertEqual(rooms, [[1, 0, 1, 1, 0, 1, -1, 2147483647]])
    }
    
    func test_F() {
        var rooms = [[2147483647],
                     [0],
                     [2147483647],
                     [0],
                     [2147483647],
                     [-1],
                     [2147483647],
                     [0],
                     [0],
                     [2147483647],
                     [2147483647],
                     [0],
                     [2147483647]]
        
        WallsAndGates().wallsAndGates(&rooms)
        
        XCTAssertEqual(rooms, [[1],
                               [0],
                               [1],
                               [0],
                               [1],
                               [-1],
                               [1],
                               [0],
                               [0],
                               [1],
                               [1],
                               [0],
                               [1]])
    }
}
