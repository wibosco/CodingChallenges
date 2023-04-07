//
//  OddEvenLinkedListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/04/2023.
//

import XCTest

@testable import LeetCode

final class OddEvenLinkedListTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4, 5]
        let list = ListNode.deserialize(data)
        
        let result = OddEvenLinkedList.oddEvenList(list)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 3, 5, 2, 4])
    }
    
    func test_B() {
        let data = [2, 1, 3, 5, 6, 4, 7]
        let list = ListNode.deserialize(data)
        
        let result = OddEvenLinkedList.oddEvenList(list)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [2, 3, 6, 7, 1, 5, 4])
    }
    
    func test_C() {
        let data = [1, 2, 3, 4]
        let list = ListNode.deserialize(data)
        
        let result = OddEvenLinkedList.oddEvenList(list)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 3, 2, 4])
    }
    
    func test_D() {
        let data = [1]
        let list = ListNode.deserialize(data)
        
        let result = OddEvenLinkedList.oddEvenList(list)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1])
    }
    
    func test_E() {
        let data = [1, 2, 3, 4, 5, 6, 7, 8]
        let list = ListNode.deserialize(data)
        
        let result = OddEvenLinkedList.oddEvenList(list)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 3, 5, 7, 2, 4, 6, 8])
    }
}
