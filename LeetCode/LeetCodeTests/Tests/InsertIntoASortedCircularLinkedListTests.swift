//
//  InsertIntoASortedCircularLinkedListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/04/2022.
//

import XCTest

@testable import LeetCode

final class InsertIntoASortedCircularLinkedListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 4, 1]
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 2
        
        let result = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [3, 4, 1, 2])
    }
    
    func test_B() {
        let data = [Int]()
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 1
        
        let result = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1])
    }
    
    func test_C() {
        let data = [1]
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 0
        
        let result = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 0])
    }
    
    func test_D() {
        let data = [3, 3, 3]
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 0
        
        let result = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [3, 3, 3, 0])
    }
    
    func test_E() {
        let data = [1, 3, 5]
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 1
        
        let result = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 1, 3, 5])
    }
}
