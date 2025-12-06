// Created 16/03/2022.


import XCTest

@testable import LeetCode

final class RemoveDuplicatesFromSortedListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 1, 2]
        let head = ListNode.deserialize(data)
        
        let result = RemoveDuplicatesFromSortedList().deleteDuplicates(head)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 2])
    }
    
    func test_B() {
        let data = [1, 1, 2, 3, 3]
        let head = ListNode.deserialize(data)
        
        let result = RemoveDuplicatesFromSortedList().deleteDuplicates(head)
        
        let values = ListNode.serialize(result)
        
        XCTAssertEqual(values, [1, 2, 3])
    }
}
