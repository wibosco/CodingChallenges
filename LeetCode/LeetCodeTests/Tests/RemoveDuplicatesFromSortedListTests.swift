//
//  RemoveDuplicatesFromSortedListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 16/03/2022.
//

import XCTest

@testable import LeetCode

class RemoveDuplicatesFromSortedListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 1, 2]
        let head = ListNode.deserialize(data)
        
        let duplicatesFreeHead = RemoveDuplicatesFromSortedList.deleteDuplicates(head)
        
        let array = ListNode.serialize(duplicatesFreeHead)
        
        XCTAssertEqual(array, [1, 2])
    }
    
    func test_B() {
        let data = [1, 1, 2, 3, 3]
        let head = ListNode.deserialize(data)
        
        let duplicatesFreeHead = RemoveDuplicatesFromSortedList.deleteDuplicates(head)
        
        let array = ListNode.serialize(duplicatesFreeHead)
        
        XCTAssertEqual(array, [1, 2, 3])
    }
}
