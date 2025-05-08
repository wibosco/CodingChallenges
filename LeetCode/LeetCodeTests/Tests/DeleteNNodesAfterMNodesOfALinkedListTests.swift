// Created 08/05/2025.

import Testing

@testable import LeetCode

struct DeleteNNodesAfterMNodesOfALinkedListTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,2,3,4,5,6,7,8,9,10,11,12,13]
        let head = ListNode.deserialize(data)
        let m = 2
        let n = 3
            
        let result = DeleteNNodesAfterMNodesOfALinkedList().deleteNodes(head, m, n)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,2,6,7,11,12])
    }
    
    @Test
    func test_B() {
        let data = [1,2,3,4,5,6,7,8,9,10,11]
        let head = ListNode.deserialize(data)
        let m = 1
        let n = 3
            
        let result = DeleteNNodesAfterMNodesOfALinkedList().deleteNodes(head, m, n)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,5,9])
    }
}
