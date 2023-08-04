//
//  LinkedListTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 04/08/2023.
//

import XCTest

@testable import Algorithms

final class LinkedListTests: XCTestCase {

    // MARK: - Reverse
    
    func test_reverse_A() {
        let data = [1, 2, 3, 4, 5]
        let head = ListNode.deserialize(data)
        
        let returnedHead = LinkedList.reverse(head)
        let result = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(result, [5, 4, 3, 2, 1])
    }
    
    func test_reverse_B() {
        let result = LinkedList<Int>.reverse(nil)
        
        XCTAssertNil(result)
    }
    
    func test_reverse_C() {
        let data = [1]
        let head = ListNode.deserialize(data)
        
        let returnedHead = LinkedList.reverse(head)
        let result = ListNode.serialize(returnedHead)
        
        XCTAssertEqual(result, [1])
    }
    
    // MARK: - HasCycle
    
    func test_hasCycle_A() {
        let data = [1, 2, 3, 4, 5]
        let head = ListNode.deserialize(data)
        
        let result = LinkedList.hasCycle(head)
        
        XCTAssertFalse(result)
    }
    
    func test_hasCycle_B() {
        let data = [1, 2, 3, 4, 5]
        let head = ListNode.deserializeCircularList(data)
        
        let result = LinkedList.hasCycle(head)
        
        XCTAssertTrue(result)
    }
    
    func test_hasCycle_C() {
        let data = [1]
        let head = ListNode.deserializeCircularList(data)
        
        let result = LinkedList.hasCycle(head)
        
        XCTAssertTrue(result)
    }
    
    func test_hasCycle_D() {
        let data = [1]
        let head = ListNode.deserialize(data)
        
        let result = LinkedList.hasCycle(head)
        
        XCTAssertFalse(result)
    }
    
    func test_hasCycle_E() {
        let result = LinkedList<Int>.hasCycle(nil)
        
        XCTAssertFalse(result)
    }
    
    // MARK: - Middle
    
    func test_middle_A() {
        let data = [1, 2, 3, 4, 5]
        let head = ListNode.deserialize(data)
        
        let result = LinkedList.middleNode(head)
        
        XCTAssertEqual(result?.val, 3)
    }
    
    func test_middle_B() {
        let data = [1, 2, 3, 4]
        let head = ListNode.deserialize(data)
        
        let result = LinkedList.middleNode(head)
        
        XCTAssertEqual(result?.val, 3)
    }
    
    func test_middle_C() {
        let data = [1, 5, 8, 14]
        let head = ListNode.deserialize(data)
        
        let result = LinkedList.middleNode(head)
        
        XCTAssertEqual(result?.val, 8)
    }
    
    func test_middle_D() {
        let result = LinkedList<Int>.middleNode(nil)
        
        XCTAssertNil(result)
    }
}
