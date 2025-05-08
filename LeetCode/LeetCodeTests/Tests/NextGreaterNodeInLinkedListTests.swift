// Created 08/05/2025.

import Testing

@testable import LeetCode

struct NextGreaterNodeInLinkedListTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [2,1,5]
        let head = ListNode.deserialize(data)
        
        let result = NextGreaterNodeInLinkedList().nextLargerNodes(head)
        
        #expect(result == [5,5,0])
    }
    
    @Test
    func test_B() {
        let data = [2,7,4,3,5]
        let head = ListNode.deserialize(data)
        
        let result = NextGreaterNodeInLinkedList().nextLargerNodes(head)
        
        #expect(result == [7,0,5,5,0])
    }
}
