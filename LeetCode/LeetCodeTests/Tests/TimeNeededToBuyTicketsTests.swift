// Created 14/11/2026.

import Testing

@testable import LeetCode

struct TimeNeededToBuyTicketsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let tickets = [2,3,2]
        let k = 2
        
        let result = TimeNeededToBuyTickets().timeRequiredToBuy(tickets, k)
        
        #expect(result == 6)
    }
    
    @Test
    func test_B() {
        let tickets = [5,1,1,1]
        let k = 0
        
        let result = TimeNeededToBuyTickets().timeRequiredToBuy(tickets, k)
        
        #expect(result == 8)
    }
    
    @Test
    func test_C() {
        let tickets = [5,1,1,2]
        let k = 0
        
        let result = TimeNeededToBuyTickets().timeRequiredToBuy(tickets, k)
        
        #expect(result == 9)
    }
    
    @Test
    func test_D() {
        let tickets = [5,1,1,2]
        let k = 1
        
        let result = TimeNeededToBuyTickets().timeRequiredToBuy(tickets, k)
        
        #expect(result == 2)
    }
}
