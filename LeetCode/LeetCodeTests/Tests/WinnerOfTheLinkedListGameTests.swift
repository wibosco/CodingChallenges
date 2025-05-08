// Created 08/05/2025.

import Testing

@testable import LeetCode

struct WinnerOfTheLinkedListGameTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let data = [2,1]
        let head = ListNode.deserialize(data)
        
        let result = WinnerOfTheLinkedListGame().gameResult(head)
        
        #expect(result == "Even")
    }
    
    @Test
    func test_B() {
        let data = [2,5,4,7,20,5]
        let head = ListNode.deserialize(data)
        
        let result = WinnerOfTheLinkedListGame().gameResult(head)
        
        #expect(result == "Odd")
    }
    
    @Test
    func test_C() {
        let data = [4,5,2,1]
        let head = ListNode.deserialize(data)
        
        let result = WinnerOfTheLinkedListGame().gameResult(head)
        
        #expect(result == "Tie")
    }
}
