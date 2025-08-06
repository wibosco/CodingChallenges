// Created 06/08/2025.

import Testing

@testable import LeetCode

struct RangeSumQueryImmutableTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let instance = RangeSumQueryImmutable([-2, 0, 3, -5, 2, -1])
        
        #expect(instance.sumRange(0, 2) == 1)
        #expect(instance.sumRange(2, 5) == -1)
        #expect(instance.sumRange(0, 5) == -3)
    }
}
