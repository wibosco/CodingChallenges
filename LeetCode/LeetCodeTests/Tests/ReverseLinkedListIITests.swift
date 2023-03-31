//
//  ReverseLinkedListIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 22/03/2022.
//

import XCTest

@testable import LeetCode

final class ReverseLinkedListIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4, 5]
        let list = ListNode.deserialize(data)
        
        let left = 2
        let right = 4
        
        let reversedList = ReverseLinkedListII.reverseBetween(list, left, right)
        
        let array = ListNode.serialize(reversedList)
        
        XCTAssertEqual(array, [1, 4, 3, 2, 5])
    }
    
    func test_B() {
        let data = [5]
        let list = ListNode.deserialize(data)
        
        let left = 1
        let right = 1
        
        let reversedList = ReverseLinkedListII.reverseBetween(list, left, right)
        
        let array = ListNode.serialize(reversedList)
        
        XCTAssertEqual(array, [5])
    }
    
    func test_C() {
        let data = [5, 4]
        let list = ListNode.deserialize(data)
        
        let left = 1
        let right = 2
        
        let reversedList = ReverseLinkedListII.reverseBetween(list, left, right)
        
        let array = ListNode.serialize(reversedList)
        
        XCTAssertEqual(array, [4, 5])
    }
}
