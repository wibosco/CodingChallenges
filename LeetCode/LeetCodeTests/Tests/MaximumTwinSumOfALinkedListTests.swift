//
//  MaximumTwinSumOfALinkedListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/08/2023.
//

import XCTest

@testable import LeetCode

final class MaximumTwinSumOfALinkedListTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [5, 4, 2, 1]
        let head = ListNode.deserialize(data)
        
        let result = MaximumTwinSumOfALinkedList.pairSum(head)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_B() {
        let data = [4, 2, 2, 3]
        let head = ListNode.deserialize(data)
        
        let result = MaximumTwinSumOfALinkedList.pairSum(head)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_C() {
        let data = [1, 100000]
        let head = ListNode.deserialize(data)
        
        let result = MaximumTwinSumOfALinkedList.pairSum(head)
        
        XCTAssertEqual(result, 100001)
    }
}
