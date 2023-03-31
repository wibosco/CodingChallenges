//
//  RemoveLinkedListElementsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/04/2022.
//

import XCTest

@testable import LeetCode

final class RemoveLinkedListElementsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 6, 3, 4, 5, 6]
        let val = 6
        
        let head = ListNode.deserialize(data)
        
        let list = RemoveLinkedListElements.removeElements(head, val)
        
        let array = ListNode.serialize(list)
        
        XCTAssertEqual(array, [1, 2, 3, 4, 5])
    }
    
    func test_B() {
        let data = [Int]()
        let val = 6
        
        let head = ListNode.deserialize(data)
        
        let list = RemoveLinkedListElements.removeElements(head, val)
        
        let array = ListNode.serialize(list)
        
        XCTAssertEqual(array, [])
    }
    
    func test_C() {
        let data = [7, 7, 7, 7]
        let val = 7
        
        let head = ListNode.deserialize(data)
        
        let list = RemoveLinkedListElements.removeElements(head, val)
        
        let array = ListNode.serialize(list)
        
        XCTAssertEqual(array, [])
    }
}
