//
//  ConvertSortedListToBinarySearchTreeTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/11/2023.
//

import XCTest

@testable import LeetCode

final class ConvertSortedListToBinarySearchTreeTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [-10,-3,0,5,9]
        let head = ListNode.deserialize(data)
        
        let result = ConvertSortedListToBinarySearchTree.sortedListToBST(head)
        let values = BinaryTreeNode.serialize(result)
        
        XCTAssertEqual(values, [0,-3,9,-10,nil,5])
    }
    
    func test_B() {
        let data = [Int]()
        let head = ListNode.deserialize(data)
        
        let result = ConvertSortedListToBinarySearchTree.sortedListToBST(head)
        let values = BinaryTreeNode.serialize(result)
        
        XCTAssertEqual(values, [Int]())
    }
}
