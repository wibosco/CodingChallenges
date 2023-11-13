//
//  AAPathSumIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/11/2023.
//

import XCTest

@testable import LeetCode

final class PathSumIITests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [5,4,8,11,nil,13,4,7,2,nil,nil,5,1]
        let root = BinaryTreeNode.deserialize(data)
        let targetSum = 22
        
        let result = PathSumII.pathSum(root, targetSum)

        XCTAssertEqual(result, [[5,4,11,2],[5,8,4,5]])
    }
    
    func test_B() {
        let data = [1,2,3]
        let root = BinaryTreeNode.deserialize(data)
        let targetSum = 5
        
        let result = PathSumII.pathSum(root, targetSum)

        XCTAssertEqual(result, [[Int]]())
    }
    
    func test_C() {
        let data = [1,2]
        let root = BinaryTreeNode.deserialize(data)
        let targetSum = 0
        
        let result = PathSumII.pathSum(root, targetSum)

        XCTAssertEqual(result, [[Int]]())
    }
    
    func test_D() {
        let data = [1,2,3]
        let root = BinaryTreeNode.deserialize(data)
        let targetSum = 6
        
        let result = PathSumII.pathSum(root, targetSum)

        XCTAssertEqual(result, [[Int]]())
    }
}
