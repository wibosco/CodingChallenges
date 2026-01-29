// Created 16/11/2023.

import XCTest

@testable import LeetCode

final class DeleteNodesAndReturnForestTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let toDelete = [3,5]
        let data = [1,2,3,4,5,6,7]
        let root = TreeNode.deserialize(data)
        
        let result = DeleteNodesAndReturnForest().delNodes(root, toDelete)
        let trees = result.map { TreeNode.serialize($0) }
        
        var expectedTrees = Set<[Int?]>()
        expectedTrees.insert([1,2,nil,4])
        expectedTrees.insert([6])
        expectedTrees.insert([7])
        
        XCTAssertEqual(trees.count, expectedTrees.count)
        
        for tree in trees {
            XCTAssertTrue(expectedTrees.contains(tree))
        }
    }
    
    func test_B() {
        let toDelete = [3]
        let data = [1,2,4,nil,3]
        let root = TreeNode.deserialize(data)
        
        let result = DeleteNodesAndReturnForest().delNodes(root, toDelete)
        let trees = result.map { TreeNode.serialize($0) }
        
        var expectedTrees = Set<[Int?]>()
        expectedTrees.insert([1,2,4])
        
        XCTAssertEqual(trees.count, expectedTrees.count)
        
        for tree in trees {
            XCTAssertTrue(expectedTrees.contains(tree))
        }
    }
}
