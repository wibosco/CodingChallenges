// Created 14/11/2023.

import XCTest

@testable import LeetCode

final class AllElementsInTwoBinarySearchTreesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data1 = [2,1,4]
        let data2 = [1,0,3]
            
        let root1 = TreeNode.deserialize(data1)
        let root2 = TreeNode.deserialize(data2)
        
        let result = AllElementsInTwoBinarySearchTrees().getAllElements(root1, root2)
        
        XCTAssertEqual(result, [0,1,1,2,3,4])
    }
    
    func test_B() {
        let data1 = [1,nil,8]
        let data2 = [8,1]
            
        let root1 = TreeNode.deserialize(data1)
        let root2 = TreeNode.deserialize(data2)
        
        let result = AllElementsInTwoBinarySearchTrees().getAllElements(root1, root2)
        
        XCTAssertEqual(result, [1,1,8,8])
    }
}
