// Created 18/11/2023.

import XCTest

@testable import LeetCode

final class FlipBinaryTreeToMatchPreorderTraversalTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,2]
        let root = TreeNode.deserialize(data)
        let voyage = [2,1]
        
        let result = FlipBinaryTreeToMatchPreorderTraversal().flipMatchVoyage(root, voyage)
        
        XCTAssertEqual(result, [-1])
    }
    
    func test_B() {
        let data = [1,2,3]
        let root = TreeNode.deserialize(data)
        let voyage = [1,3,2]
        
        let result = FlipBinaryTreeToMatchPreorderTraversal().flipMatchVoyage(root, voyage)
        
        XCTAssertEqual(result, [1])
    }
    
    func test_C() {
        let data = [1,2,3]
        let root = TreeNode.deserialize(data)
        let voyage = [1,2,3]
        
        let result = FlipBinaryTreeToMatchPreorderTraversal().flipMatchVoyage(root, voyage)
        
        XCTAssertEqual(result, [])
    }
    
    func test_D() {
        let data = [2,1,4,5,nil,3]
        let root = TreeNode.deserialize(data)
        let voyage = [2,4,3,1,5]
        
        let result = FlipBinaryTreeToMatchPreorderTraversal().flipMatchVoyage(root, voyage)
        
        XCTAssertEqual(result, [2])
    }
    
    func test_E() {
        let data = [1,2,nil,3]
        let root = TreeNode.deserialize(data)
        let voyage = [1,3,2]
        
        let result = FlipBinaryTreeToMatchPreorderTraversal().flipMatchVoyage(root, voyage)
        
        XCTAssertEqual(result, [-1])
    }
}
