// Created 22/11/2023.


import XCTest

@testable import LeetCode

final class EqualTreePartitionTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [5,10,10,nil,nil,2,3]
        let root = TreeNode.deserialize(data)
        
        let result = EqualTreePartition().checkEqualTree(root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [1,2,10,nil,nil,2,20]
        let root = TreeNode.deserialize(data)
        
        let result = EqualTreePartition().checkEqualTree(root)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let data = [0,-1,1]
        let root = TreeNode.deserialize(data)
        
        let result = EqualTreePartition().checkEqualTree(root)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let data = [2,nil,3,nil,4,nil,5,nil,6]
        let root = TreeNode.deserialize(data)
        
        let result = EqualTreePartition().checkEqualTree(root)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let data = [2,1,3,0,2,nil,nil,nil,nil,2,nil,1,nil,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = EqualTreePartition().checkEqualTree(root)
        
        XCTAssertTrue(result)
    }
}
