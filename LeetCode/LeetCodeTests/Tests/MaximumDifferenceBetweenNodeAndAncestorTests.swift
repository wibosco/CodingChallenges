// Created 15/11/2023.

import XCTest

@testable import LeetCode

final class MaximumDifferenceBetweenNodeAndAncestorTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [8,3,10,1,6,nil,14,nil,nil,4,7,13]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumDifferenceBetweenNodeAndAncestor().maxAncestorDiff(root)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_B() {
        let data = [1,nil,2,nil,0,3]
        let root = TreeNode.deserialize(data)
        
        let result = MaximumDifferenceBetweenNodeAndAncestor().maxAncestorDiff(root)
        
        XCTAssertEqual(result, 3)
    }
}
