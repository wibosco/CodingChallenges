// Created 08/05/2025.

import Testing

@testable import LeetCode

struct ConvertBinaryNumberInALinkedListToIntegerTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,0,1]
        let head = ListNode.deserialize(data)
        
        let result = ConvertBinaryNumberInALinkedListToInteger().getDecimalValue(head)
        
        #expect(result == 5)
    }
    
    @Test
    func test_B() {
        let data = [0]
        let head = ListNode.deserialize(data)
        
        let result = ConvertBinaryNumberInALinkedListToInteger().getDecimalValue(head)
        
        #expect(result == 0)
    }
}
