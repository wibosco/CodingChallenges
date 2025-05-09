// Created 09/05/2025.

import Testing

@testable import LeetCode

struct MergeInBetweenLinkedListsTests {
    
    // MARK: - Tests
    
    @Test
    func test_A() {
        let data1 = [10,1,13,6,9,5]
        let list1 = ListNode.deserialize(data1)
        let a = 3
        let b = 4
        let data2 = [1000000,1000001,1000002]
        let list2 = ListNode.deserialize(data2)
        
        let result = MergeInBetweenLinkedLists().mergeInBetween(list1, a, b, list2)
        let values = ListNode.serialize(result)
        
        #expect(values == [10,1,13,1000000,1000001,1000002,5])
    }
    
    @Test
    func test_B() {
        let data1 = [0,1,2,3,4,5,6]
        let list1 = ListNode.deserialize(data1)
        let a = 2
        let b = 5
        let data2 = [1000000,1000001,1000002,1000003,1000004]
        let list2 = ListNode.deserialize(data2)
        
        let result = MergeInBetweenLinkedLists().mergeInBetween(list1, a, b, list2)
        let values = ListNode.serialize(result)
        
        #expect(values == [0,1,1000000,1000001,1000002,1000003,1000004,6])
    }
}
