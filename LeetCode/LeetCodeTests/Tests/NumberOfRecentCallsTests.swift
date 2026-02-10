// Created 10/02/2026.

import Testing

@testable import LeetCode

struct NumberOfRecentCallsTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let sut = RecentCounter()
        
        #expect(sut.ping(1) == 1)
        #expect(sut.ping(100) == 2)
        #expect(sut.ping(3001) == 3)
        #expect(sut.ping(3002) == 3)
    }
}
