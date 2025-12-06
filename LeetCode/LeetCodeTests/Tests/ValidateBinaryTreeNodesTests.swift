// Created 23/02/2024.


import XCTest

@testable import LeetCode

final class ValidateBinaryTreeNodesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let n = 4
        let leftChild = [1,-1,3,-1]
        let rightChild = [2,-1,-1,-1]
        
        let result = ValidateBinaryTreeNodes().validateBinaryTreeNodes(n, leftChild, rightChild)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let n = 4
        let leftChild = [1,-1,3,-1]
        let rightChild = [2,3,-1,-1]
        
        let result = ValidateBinaryTreeNodes().validateBinaryTreeNodes(n, leftChild, rightChild)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let n = 2
        let leftChild = [1,0]
        let rightChild = [-1,-1]
        
        let result = ValidateBinaryTreeNodes().validateBinaryTreeNodes(n, leftChild, rightChild)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let n = 4
        let leftChild = [3,-1,1,-1]
        let rightChild = [-1,-1,0,-1]
        
        let result = ValidateBinaryTreeNodes().validateBinaryTreeNodes(n, leftChild, rightChild)
        
        XCTAssertTrue(result)
    }
    
    func test_E() {
        let n = 4
        let leftChild = [1,0,3,-1]
        let rightChild = [-1,-1,-1,-1]
        
        let result = ValidateBinaryTreeNodes().validateBinaryTreeNodes(n, leftChild, rightChild)
        
        XCTAssertFalse(result)
    }
}
