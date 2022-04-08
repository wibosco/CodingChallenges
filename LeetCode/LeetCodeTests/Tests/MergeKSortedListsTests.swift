//
//  MergeKSortedListsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/04/2022.
//

import XCTest

@testable import LeetCode

class MergeKSortedListsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let list1 = ListNode.deserialize([1, 4, 5])
        let list2 = ListNode.deserialize([1, 3, 4])
        let list3 = ListNode.deserialize([2, 6])
        
        let lists = [list1, list2, list3]
        
        let mergedList = MergeKSortedLists.mergeKLists(lists)
        
        let array = ListNode.serialize(mergedList)
        
        XCTAssertEqual(array, [1, 1, 2, 3, 4, 4, 5, 6])
    }
    
    func test_B() {
        let list1 = ListNode.deserialize([Int]())
        
        let lists = [list1]
        
        let mergedList = MergeKSortedLists.mergeKLists(lists)
        
        let array = ListNode.serialize(mergedList)
        
        XCTAssertEqual(array, [Int]())
    }
}
