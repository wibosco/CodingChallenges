// Created 09/05/2025.

import Testing

@testable import LeetCode

struct ReverseNodesInEvenLengthGroupsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [5,2,6,3,9,1,7,3,8,4]
        let head = ListNode.deserialize(data)
        
        let result = ReverseNodesInEvenLengthGroups().reverseEvenLengthGroups(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [5,6,2,3,9,1,4,8,3,7])
    }
    
    @Test
    func test_B() {
        let data = [1,1,0,6]
        let head = ListNode.deserialize(data)
        
        let result = ReverseNodesInEvenLengthGroups().reverseEvenLengthGroups(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,0,1,6])
    }
    
    @Test
    func test_C() {
        let data = [1,1,0,6,5]
        let head = ListNode.deserialize(data)
        
        let result = ReverseNodesInEvenLengthGroups().reverseEvenLengthGroups(head)
        let values = ListNode.serialize(result)
        
        #expect(values == [1,0,1,5,6])
    }
}
