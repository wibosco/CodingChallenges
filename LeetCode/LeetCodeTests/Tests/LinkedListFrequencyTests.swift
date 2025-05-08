// Created 08/05/2025.

import Testing

@testable import LeetCode

struct LinkedListFrequencyTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [1,1,2,1,2,3]
        let head = ListNode.deserialize(data)
        
        let result = LinkedListFrequency().frequenciesOfElements(head)
        let values = ListNode.serialize(result)
        
        let expectedValues = Set([1,2,3])
        
        #expect(values.count == 3)
        
        for value in values {
            #expect(expectedValues.contains(value) == true)
        }
    }
    
    @Test
    func test_B() {
        let data = [1,1,2,2,2]
        let head = ListNode.deserialize(data)
        
        let result = LinkedListFrequency().frequenciesOfElements(head)
        let values = ListNode.serialize(result)
        
        let expectedValues = Set([2,3])
        
        #expect(values.count == 2)
        
        for value in values {
            #expect(expectedValues.contains(value) == true)
        }
    }
    
    @Test
    func test_C() {
        let data = [6,5,4,3,2,1]
        let head = ListNode.deserialize(data)
        
        let result = LinkedListFrequency().frequenciesOfElements(head)
        let values = ListNode.serialize(result)
        
        let expectedValues = Set([1,1,1,1,1,1])
        
        #expect(values.count == 6)
        
        for value in values {
            #expect(expectedValues.contains(value) == true)
        }
    }
}
