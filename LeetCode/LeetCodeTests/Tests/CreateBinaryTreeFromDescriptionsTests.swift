// Created 16/11/2023.


import XCTest

@testable import LeetCode

final class CreateBinaryTreeFromDescriptionsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let descriptions = [[20,15,1],[20,17,0],[50,20,1],[50,80,0],[80,19,1]]
        
        let result = CreateBinaryTreeFromDescriptions().createBinaryTree(descriptions)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [50,20,80,15,17,19])
    }
    
    func test_B() {
        let descriptions = [[1,2,1],[2,3,0],[3,4,1]]
        
        let result = CreateBinaryTreeFromDescriptions().createBinaryTree(descriptions)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,2,nil,nil,3,4])
    }
}
