// Created 07/12/2023.


import XCTest

@testable import LeetCode

final class CountNodesEqualToSumOfDescendantsTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [10,3,4,2,1]
        let root = TreeNode.deserialize(data)
        
        let result = CountNodesEqualToSumOfDescendants().equalToDescendants(root)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let data = [2,3,nil,2,nil]
        let root = TreeNode.deserialize(data)
        
        let result = CountNodesEqualToSumOfDescendants().equalToDescendants(root)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let data = [0]
        let root = TreeNode.deserialize(data)
        
        let result = CountNodesEqualToSumOfDescendants().equalToDescendants(root)
        
        XCTAssertEqual(result, 1)
    }
}
