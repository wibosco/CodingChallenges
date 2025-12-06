// Created 13/12/2023.


import XCTest

@testable import LeetCode

final class BinaryTreeColoringGameTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let n = 11
        let x = 3
        let data = [1,2,3,4,5,6,7,8,9,10,11]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeColoringGame().btreeGameWinningMove(root, n, x)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let n = 3
        let x = 1
        let data = [1,2,3]
        let root = TreeNode.deserialize(data)
        
        let result = BinaryTreeColoringGame().btreeGameWinningMove(root, n, x)
        
        XCTAssertFalse(result)
    }
}
