// Created 05/12/2023.


import XCTest

@testable import LeetCode

final class SmallestStringStartingFromLeafTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [0,1,2,3,4,3,4]
        let root = TreeNode.deserialize(data)
        
        let result = SmallestStringStartingFromLeaf().smallestFromLeaf(root)
        
        XCTAssertEqual(result, "dba")
    }
    
    func test_B() {
        let data = [25,1,3,1,3,0,2]
        let root = TreeNode.deserialize(data)
        
        let result = SmallestStringStartingFromLeaf().smallestFromLeaf(root)
        
        XCTAssertEqual(result, "adz")
    }
    
    func test_C() {
        let data = [2,2,1,nil,1,0,nil,0]
        let root = TreeNode.deserialize(data)
        
        let result = SmallestStringStartingFromLeaf().smallestFromLeaf(root)
        
        XCTAssertEqual(result, "abc")
    }
    
    func test_D() {
        let data = [0,nil,1]
        let root = TreeNode.deserialize(data)
        
        let result = SmallestStringStartingFromLeaf().smallestFromLeaf(root)
        
        XCTAssertEqual(result, "ba")
    }
    
    
    func test_E() {
        let data = [25,1,nil,0,0,1,nil,nil,nil,0]
        let root = TreeNode.deserialize(data)
        
        let result = SmallestStringStartingFromLeaf().smallestFromLeaf(root)
        
        XCTAssertEqual(result, "ababz")
    }
}
