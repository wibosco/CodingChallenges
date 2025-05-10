// Created 10/05/2025.

import Testing

@testable import LeetCode

struct SortLinkedListAlreadySortedUsingAbsoluteValuesTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [0,2,-5,5,10,-10]
        let head = ListNode.deserialize(data)
        
        let result = SortLinkedListAlreadySortedUsingAbsoluteValues().sortLinkedList(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [-10,-5,0,2,5,10])
    }
    
    @Test
    func test_B() {
        let data = [0,1,2]
        let head = ListNode.deserialize(data)
        
        let result = SortLinkedListAlreadySortedUsingAbsoluteValues().sortLinkedList(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [0,1,2])
    }
    
    @Test
    func test_C() {
        let data = [1]
        let head = ListNode.deserialize(data)
        
        let result = SortLinkedListAlreadySortedUsingAbsoluteValues().sortLinkedList(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1])
    }
    
    @Test
    func test_D() {
        let data = [-1,-3,-7,-9]
        let head = ListNode.deserialize(data)
        
        let result = SortLinkedListAlreadySortedUsingAbsoluteValues().sortLinkedList(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [-9,-7,-3,-1])
    }
}
