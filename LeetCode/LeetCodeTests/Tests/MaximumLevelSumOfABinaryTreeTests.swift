// Created 17/11/2023.


import XCTest

@testable import LeetCode

final class MaximumLevelSumOfABinaryTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,7,0,7,-8,nil,nil]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumLevelSumOfABinaryTree().maxLevelSum(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let data = [989,nil,10250,98693,-89388,nil,nil,nil,-32127]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumLevelSumOfABinaryTree().maxLevelSum(root)
        
        XCTAssertEqual(result, 2)
    }
}
