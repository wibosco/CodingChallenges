// Created 20/11/2023.


import XCTest

@testable import LeetCode

final class LargestBSTSubtreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [10,5,15,1,8,nil,7]
        let root = TreeNode.deserialize(data)
            
        let result = LargestBSTSubtree().largestBSTSubtree(root)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let data = [4,2,7,2,3,5,nil,2,nil,nil,nil,nil,nil,1]
        let root = TreeNode.deserialize(data)
            
        let result = LargestBSTSubtree().largestBSTSubtree(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let data = [Int]()
        let root = TreeNode.deserialize(data)
            
        let result = LargestBSTSubtree().largestBSTSubtree(root)
        
        XCTAssertEqual(result, 0)
    }
}
