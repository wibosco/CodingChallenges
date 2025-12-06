// Created 07/12/2023.


import XCTest

@testable import LeetCode

final class FindDistanceInABinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let p = 5
        let q = 0
        let data = [3,5,1,6,2,0,8,nil,nil,7,4]
        let root = TreeNode.deserialize(data)
    
        let result = FindDistanceInABinaryTree().findDistance(root, p, q)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let p = 5
        let q = 7
        let data = [3,5,1,6,2,0,8,nil,nil,7,4]
        let root = TreeNode.deserialize(data)
    
        let result = FindDistanceInABinaryTree().findDistance(root, p, q)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let p = 5
        let q = 5
        let data = [3,5,1,6,2,0,8,nil,nil,7,4]
        let root = TreeNode.deserialize(data)
    
        let result = FindDistanceInABinaryTree().findDistance(root, p, q)
        
        XCTAssertEqual(result, 0)
    }
}
