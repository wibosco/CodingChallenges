// Created 09/05/2025.

import Testing

@testable import LeetCode

struct SplitLinkedListInPartsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,2,3]
        let head = ListNode.deserialize(data)
        let k = 5
        
        let result = SplitLinkedListInParts().splitListToParts(head, k)
        let values = result.map { ListNode.serialize($0) }
       
        #expect(values == [[1],[2],[3],[],[]])
    }
    
    @Test
    func test_B() {
        let data = [1,2,3,4,5,6,7,8,9,10]
        let head = ListNode.deserialize(data)
        let k = 3
        
        let result = SplitLinkedListInParts().splitListToParts(head, k)
        let values = result.map { ListNode.serialize($0) }
       
        #expect(values == [[1,2,3,4],[5,6,7],[8,9,10]])
    }
}
