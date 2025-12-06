// Created 11/03/2022.


import XCTest

@testable import LeetCode

final class DetermineWhetherMatrixCanBeObtainedByRotationTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let mat = [[0, 1], [1, 0]]
        let target = [[1, 0], [0, 1]]
        
        let result = DetermineWhetherMatrixCanBeObtainedByRotation().findRotation(mat, target)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let mat = [[0, 1], [1, 1]]
        let target = [[1, 0], [0, 1]]
        
        let result = DetermineWhetherMatrixCanBeObtainedByRotation().findRotation(mat, target)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let mat = [[0, 0, 0], [0, 1, 0], [1, 1, 1]]
        let target = [[1, 1, 1], [0, 1, 0], [0, 0, 0]]
        
        let result = DetermineWhetherMatrixCanBeObtainedByRotation().findRotation(mat, target)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let mat = [[0, 0, 0], [0, 0, 1], [0, 0, 1]]
        let target = [[0, 0, 0], [0, 0, 1], [0, 0, 1]]
        
        let result = DetermineWhetherMatrixCanBeObtainedByRotation().findRotation(mat, target)
        
        XCTAssertTrue(result)
    }
}
