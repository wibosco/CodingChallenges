// Created 14/11/2023.

import XCTest

@testable import LeetCode

final class PathSumIIITests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let targetSum = 8
        let data = [10,5,-3,3,2,nil,11,3,-2,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = PathSumIII().pathSum(root, targetSum)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let targetSum = 22
        let data = [5,4,8,11,nil,13,4,7,2,nil,nil,5,1]
        let root = TreeNode.deserialize(data)
        
        let result = PathSumIII().pathSum(root, targetSum)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let targetSum = 3
        let data = [1,nil,2,nil,3,nil,4,nil,5]
        let root = TreeNode.deserialize(data)
        
        let result = PathSumIII().pathSum(root, targetSum)
        
        XCTAssertEqual(result, 2)
    }
}
