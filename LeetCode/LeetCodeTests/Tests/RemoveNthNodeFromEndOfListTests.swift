// Created 09/11/2021.


import XCTest

@testable import LeetCode

final class RemoveNthNodeFromEndOfListTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let head = ListNode.deserialize([1, 2, 3, 4, 5])
        let n = 2
        
        let result = RemoveNthNodeFromEndOfList().removeNthFromEnd(head, n)
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 2, 3, 5])
    }
    
    func test_B() {
        let head = ListNode.deserialize([1])
        let n = 1
        
        let result = RemoveNthNodeFromEndOfList().removeNthFromEnd(head, n)
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [])
    }
    
    func test_C() {
        let head = ListNode.deserialize([1, 2])
        let n = 1
        
        let result = RemoveNthNodeFromEndOfList().removeNthFromEnd(head, n)
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1])
    }
    
    func test_D() {
        let head = ListNode.deserialize([1, 2])
        let n = 2
        
        let result = RemoveNthNodeFromEndOfList().removeNthFromEnd(head, n)
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [2])
    }
    
    func test_E() {
        let head = ListNode.deserialize([4, 5, 4])
        let n = 1
        
        let result = RemoveNthNodeFromEndOfList().removeNthFromEnd(head, n)
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [4, 5])
    }
}
