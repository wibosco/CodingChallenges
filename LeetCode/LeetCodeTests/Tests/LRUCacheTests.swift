// Created 30/07/2025.

import Testing

@testable import LeetCode

struct LRUCacheTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let cache = LRUCache(2)
        
        cache.put(1, 1)
        cache.put(2, 2)
        
        #expect(cache.get(1) == 1)
        
        cache.put(3, 3)
        
        #expect(cache.get(2) == -1)
        
        cache.put(4, 4)
        
        #expect(cache.get(1) == -1)
        #expect(cache.get(3) == 3)
        #expect(cache.get(4) == 4)
    }
    
    @Test
    func test_B() {
        let cache = LRUCache(2)
        
        cache.put(2, 1)
        cache.put(1, 1)
        cache.put(2, 3)
        cache.put(4, 1)
        
        #expect(cache.get(1) == -1)
        #expect(cache.get(2) == 3)
    }
    
    @Test
    func test_C() {
        let cache = LRUCache(1)
        
        cache.put(2, 1)
        
        #expect(cache.get(2) == 1)
    }
}
