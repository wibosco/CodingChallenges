// Created 17/11/2023.


import XCTest

@testable import LeetCode

final class SmallestSubtreeWithAllTheDeepestNodesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [3,5,1,6,2,0,8,nil,nil,7,4]
        let root = TreeNode.deserialize(data)
        
        let result = SmallestSubtreeWithAllTheDeepestNodes().subtreeWithAllDeepest(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [2,7,4])
    }
    
    func test_B() {
        let data = [1]
        let root = TreeNode.deserialize(data)
        
        let result = SmallestSubtreeWithAllTheDeepestNodes().subtreeWithAllDeepest(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1])
    }
    
    func test_C() {
        let data = [0,1,3,nil,2]
        let root = TreeNode.deserialize(data)
        
        let result = SmallestSubtreeWithAllTheDeepestNodes().subtreeWithAllDeepest(root)
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [2])
    }
}
