//
//  SwappingNodesInALinkedListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/08/2023.
//

import XCTest

@testable import LeetCode

final class SwappingNodesInALinkedListTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let k = 2
        let data = [1, 2, 3, 4, 5]
        let head = ListNode.deserialize(data)
        
        let returnedHead = SwappingNodesInALinkedList.swapNodes(head, k)
        let result = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(result, [1, 4, 3, 2, 5])
    }
    
    func test_B() {
        let k = 5
        let data = [7, 9, 6, 6, 7, 8, 3, 0, 9, 5]
        let head = ListNode.deserialize(data)
        
        let returnedHead = SwappingNodesInALinkedList.swapNodes(head, k)
        let result = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(result, [7, 9, 6, 6, 8, 7, 3, 0, 9, 5])
    }
    
    func test_C() {
        let k = 1
        let data = [7, 9, 5]
        let head = ListNode.deserialize(data)
        
        let returnedHead = SwappingNodesInALinkedList.swapNodes(head, k)
        let result = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(result, [5, 9, 7])
    }
    
    func test_D() {
        let k = 1
        let data = [7, 5]
        let head = ListNode.deserialize(data)
        
        let returnedHead = SwappingNodesInALinkedList.swapNodes(head, k)
        let result = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(result, [5, 7])
    }
    
    func test_E() {
        let k = 1
        let data = [7]
        let head = ListNode.deserialize(data)
        
        let returnedHead = SwappingNodesInALinkedList.swapNodes(head, k)
        let result = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(result, [7])
    }
    
    func test_F() {
        let k = 2
        let data = [100, 90]
        let head = ListNode.deserialize(data)
        
        let returnedHead = SwappingNodesInALinkedList.swapNodes(head, k)
        let result = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(result, [90, 100])
    }
}
