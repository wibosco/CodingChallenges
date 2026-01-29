// Created 06/12/2021.

import XCTest

@testable import LeetCode

final class NaryTreeLevelOrderTraversalTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, nil, 3, 2, 4, nil, 5, 6]
        
        let root = NaryTreeNode.deserialize(data)
        
        let result = NaryTreeLevelOrderTraversal().levelOrder(root)
        
        XCTAssertEqual(result, [[1], [3, 2, 4], [5, 6]])
    }
    
    func test_B() {
        let data = [1, nil, 2, 3, 4, 5, nil, nil, 6, 7, nil, 8, nil, 9, 10, nil, nil, 11, nil, 12, nil, 13, nil, nil, 14]
        
        let root = NaryTreeNode.deserialize(data)
        
        let result = NaryTreeLevelOrderTraversal().levelOrder(root)
        
        XCTAssertEqual(result, [[1], [2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13], [14]])
    }
}
