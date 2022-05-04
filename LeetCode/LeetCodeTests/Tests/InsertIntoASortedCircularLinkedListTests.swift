//
//  InsertIntoASortedCircularLinkedListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 20/04/2022.
//

import XCTest

@testable import LeetCode

class InsertIntoASortedCircularLinkedListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [3, 4, 1]
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 2
        
        let insertedList = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let array = ListNode.serialize(insertedList)
        
        XCTAssertEqual(array, [3, 4, 1, 2])
    }
    
    func test_B() {
        let data = [Int]()
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 1
        
        let insertedList = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let array = ListNode.serialize(insertedList)
        
        XCTAssertEqual(array, [1])
    }
    
    func test_C() {
        let data = [1]
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 0
        
        let insertedList = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let array = ListNode.serialize(insertedList)
        
        XCTAssertEqual(array, [1, 0])
    }
    
    func test_D() {
        let data = [3, 3, 3]
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 0
        
        let insertedList = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let array = ListNode.serialize(insertedList)
        
        XCTAssertEqual(array, [3, 3, 3, 0])
    }
    
    func test_E() {
        let data = [1, 3, 5]
        let list = ListNode.deserializeCircularList(data)
        
        let insertVal = 1
        
        let insertedList = InsertIntoASortedCircularLinkedList.insert(list, insertVal)
        
        let array = ListNode.serialize(insertedList)
        
        XCTAssertEqual(array, [1, 1, 3, 5])
    }
}
