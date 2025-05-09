// Created 09/05/2025.

import Testing

@testable import LeetCode

struct InsertionSortListTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [4,2,1,3]
        let head = ListNode.deserialize(data)
        
        let result = InsertionSortList().insertionSortList(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,2,3,4])
    }
    
    @Test
    func test_B() {
        let data = [-1,5,3,4,0]
        let head = ListNode.deserialize(data)
        
        let result = InsertionSortList().insertionSortList(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [-1,0,3,4,5])
    }

}
