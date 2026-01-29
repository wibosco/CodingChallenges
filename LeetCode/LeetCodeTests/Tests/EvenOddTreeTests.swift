// Created 08/12/2023.

import XCTest

@testable import LeetCode

final class EvenOddTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1,10,4,3,nil,7,9,12,8,6,nil,nil,2]
        let root = TreeNode.deserialize(data)
        
        let result = EvenOddTree().isEvenOddTree(root)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [5,4,2,3,3,7]
        let root = TreeNode.deserialize(data)
        
        let result = EvenOddTree().isEvenOddTree(root)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let data = [5,9,1,3,5,7]
        let root = TreeNode.deserialize(data)
        
        let result = EvenOddTree().isEvenOddTree(root)
        
        XCTAssertFalse(result)
    }
}
