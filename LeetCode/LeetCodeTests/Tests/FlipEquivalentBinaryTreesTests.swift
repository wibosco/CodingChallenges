//
//  FlipEquivalentBinaryTreesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/11/2023.
//

import XCTest

@testable import LeetCode

final class FlipEquivalentBinaryTreesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data1 = [1,2,3,4,5,6,nil,nil,nil,7,8]
        let data2 = [1,3,2,nil,6,4,5,nil,nil,nil,nil,8,7]
            
        let root1 = TreeNode.deserialize(data1)
        let root2 = TreeNode.deserialize(data2)
        
        let result = FlipEquivalentBinaryTrees.flipEquiv(root1, root2)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data1 = [Int]()
        let data2 = [Int]()
            
        let root1 = TreeNode.deserialize(data1)
        let root2 = TreeNode.deserialize(data2)
        
        let result = FlipEquivalentBinaryTrees.flipEquiv(root1, root2)
        
        XCTAssertTrue(result)
    }
    
    func test_C() {
        let data1 = [Int]()
        let data2 = [1]
            
        let root1 = TreeNode.deserialize(data1)
        let root2 = TreeNode.deserialize(data2)
        
        let result = FlipEquivalentBinaryTrees.flipEquiv(root1, root2)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let data1 = [1,2,3]
        let data2 = [1,2,4,3]
            
        let root1 = TreeNode.deserialize(data1)
        let root2 = TreeNode.deserialize(data2)
        
        let result = FlipEquivalentBinaryTrees.flipEquiv(root1, root2)
        
        XCTAssertFalse(result)
    }
}
