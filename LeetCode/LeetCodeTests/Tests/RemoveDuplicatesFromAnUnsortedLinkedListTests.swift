// Created 10/05/2025.

import Testing

@testable import LeetCode

struct RemoveDuplicatesFromAnUnsortedLinkedListTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,2,3,2]
        let head = ListNode.deserialize(data)
        
        let result = RemoveDuplicatesFromAnUnsortedLinkedList().deleteDuplicatesUnsorted(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,3])
    }
    
    @Test
    func test_B() {
        let data = [2,1,1,2]
        let head = ListNode.deserialize(data)
        
        let result = RemoveDuplicatesFromAnUnsortedLinkedList().deleteDuplicatesUnsorted(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [])
    }
    
    @Test
    func test_C() {
        let data = [3,2,2,1,3,2,4]
        let head = ListNode.deserialize(data)
        
        let result = RemoveDuplicatesFromAnUnsortedLinkedList().deleteDuplicatesUnsorted(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,4])
    }
}
