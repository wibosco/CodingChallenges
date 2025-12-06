// Created 10/11/2021.


import XCTest

@testable import LeetCode

final class MergeTwoSortedListsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let l1 = ListNode.deserialize([1, 2, 4])
        let l2 = ListNode.deserialize([1, 3, 4])
        
        let result = MergeTwoSortedLists().mergeTwoLists(l1, l2)
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 1, 2, 3, 4, 4])
    }
    
    func test_B() {
        let l1 = ListNode.deserialize([])
        let l2 = ListNode.deserialize([])
        
        let result = MergeTwoSortedLists().mergeTwoLists(l1, l2)
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [])
    }
    
    func test_C() {
        let l1 = ListNode.deserialize([])
        let l2 = ListNode.deserialize([0])
        
        let result = MergeTwoSortedLists().mergeTwoLists(l1, l2)
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [0])
    }
}
