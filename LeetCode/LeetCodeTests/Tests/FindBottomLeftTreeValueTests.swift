// Created 15/11/2023.

import XCTest

@testable import LeetCode

final class FindBottomLeftTreeValueTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [2,1,3]
        let root = TreeNode.deserialize(data)
        
        let result = FindBottomLeftTreeValue().findBottomLeftValue(root)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let data = [1,2,3,4,nil,5,6,nil,nil,7]
        let root = TreeNode.deserialize(data)
        
        let result = FindBottomLeftTreeValue().findBottomLeftValue(root)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_C() {
        let data = [0,nil,-1]
        let root = TreeNode.deserialize(data)
        
        let result = FindBottomLeftTreeValue().findBottomLeftValue(root)
        
        XCTAssertEqual(result, -1)
    }
}
