// Created 21/11/2021.


import XCTest

@testable import LeetCode

final class ReorderListTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let list = ListNode.deserialize([1, 2, 3, 4])
        
        ReorderList().reorderList(list)
        
        let result = ListNode.serialize(list)
        
        XCTAssertEqual(result, [1, 4, 2, 3])
    }
    
    func test_B() {
        let list = ListNode.deserialize([1, 2, 3, 4, 5])
        
        ReorderList().reorderList(list)
        
        let result = ListNode.serialize(list)
        
        XCTAssertEqual(result, [1, 5, 2, 4, 3])
    }
    
    func test_C() {
        let list = ListNode.deserialize([1, 2])
        
        ReorderList().reorderList(list)
        
        let result = ListNode.serialize(list)
        
        XCTAssertEqual(result, [1, 2])
    }
}
