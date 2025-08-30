// Created 30/08/2025.

import Testing

@testable import LeetCode

struct SimpleBankSystemTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let balances = [10,100,20,50,30]
        
        let sut = SimpleBankSystem(balances)
        
        #expect(sut.withdraw(3, 10) == true)
        #expect(sut.transfer(5, 1, 20) == true)
        #expect(sut.deposit(5, 20) == true)
        #expect(sut.transfer(3, 4, 15) == false)
        #expect(sut.withdraw(10, 50) == false)
    }
}
