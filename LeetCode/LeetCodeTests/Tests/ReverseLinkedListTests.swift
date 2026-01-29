// Created 16/12/2021.

import XCTest

@testable import LeetCode

final class ReverseLinkedListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4, 5]
        let head = ListNode.deserialize(data)
        
        let result = ReverseLinkedList().reverseList(head)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [5, 4, 3, 2, 1])
    }
    
    func test_B() {
        let data = [1, 2]
        let head = ListNode.deserialize(data)
        
        let result = ReverseLinkedList().reverseList(head)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [2, 1])
    }
    
    func test_C() {
        let data = [Int]()
        let head = ListNode.deserialize(data)
        
        let result = ReverseLinkedList().reverseList(head)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [])
    }
}
