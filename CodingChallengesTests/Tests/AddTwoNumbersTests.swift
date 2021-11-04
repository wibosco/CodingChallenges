//
//  AddTwoNumbersTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 03/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class AddTwoNumbersTests: XCTestCase {

    // MARK: - Tests
    
    func test_addTwoNumbersA() {
        let l1 = ListNode.createList(fromArray: [2, 4, 3])
        let l2 = ListNode.createList(fromArray: [5, 6, 4])
        
        let node = AddTwoNumbers.addTwoNumbers(l1, l2)
        
        XCTAssertEqual(node?.val, 7)
        XCTAssertEqual(node?.next?.val, 0)
        XCTAssertEqual(node?.next?.next?.val, 8)
    }
    
    func test_addTwoNumbersB() {
        let l1 = ListNode.createList(fromArray: [0])
        let l2 = ListNode.createList(fromArray: [0])
        
        let node = AddTwoNumbers.addTwoNumbers(l1, l2)
        
        XCTAssertEqual(node?.val, 0)
    }
    
    func test_addTwoNumbersC() {
        let l1 = ListNode.createList(fromArray: [9, 9, 9, 9, 9, 9, 9])
        let l2 = ListNode.createList(fromArray: [9, 9, 9, 9])
        
        let node = AddTwoNumbers.addTwoNumbers(l1, l2)
        
        XCTAssertEqual(node?.val, 8)
        XCTAssertEqual(node?.next?.val, 9)
        XCTAssertEqual(node?.next?.next?.val, 9)
        XCTAssertEqual(node?.next?.next?.next?.val, 9)
        XCTAssertEqual(node?.next?.next?.next?.next?.val, 0)
        XCTAssertEqual(node?.next?.next?.next?.next?.next?.val, 0)
        XCTAssertEqual(node?.next?.next?.next?.next?.next?.next?.val, 0)
        XCTAssertEqual(node?.next?.next?.next?.next?.next?.next?.next?.val, 1)
    }
    
    func test_addTwoNumbersD() {
        let l1 = ListNode.createList(fromArray: [2, 4, 9])
        let l2 = ListNode.createList(fromArray: [5, 6, 4, 9])
        
        let node = AddTwoNumbers.addTwoNumbers(l1, l2)

        XCTAssertEqual(node?.val, 7)
        XCTAssertEqual(node?.next?.val, 0)
        XCTAssertEqual(node?.next?.next?.val, 4)
        XCTAssertEqual(node?.next?.next?.next?.val, 0)
        XCTAssertEqual(node?.next?.next?.next?.next?.val, 1)
    }
}

private extension ListNode {
    static func createList(fromArray array: [Int]) -> ListNode {
        var prev: ListNode?
        for value in array.reversed() {
            let node = ListNode(value)
            node.next = prev
            prev = node
        }
        
        return prev!
    }
}
