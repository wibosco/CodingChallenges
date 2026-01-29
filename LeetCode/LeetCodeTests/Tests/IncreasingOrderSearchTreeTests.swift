// Created 10/11/2023.

import XCTest

@testable import LeetCode

final class IncreasingOrderSearchTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [5,3,6,2,4,nil,8,1,nil,nil,nil,7,9]
        let root = TreeNode.deserialize(data)
        
        let result = IncreasingOrderSearchTree().increasingBST(root)
        
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,nil,2,nil,3,nil,4,nil,5,nil,6,nil,7,nil,8,nil,9])
    }
    
    func test_B() {
        let data = [5,1,7]
        let root = TreeNode.deserialize(data)
        
        let result = IncreasingOrderSearchTree().increasingBST(root)
        
        let values = TreeNode.serialize(result)
        
        XCTAssertEqual(values, [1,nil,5,nil,7])
    }
}
