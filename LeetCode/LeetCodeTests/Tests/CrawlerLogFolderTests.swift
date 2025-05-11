// Created 11/05/2025.

import Testing

@testable import LeetCode

struct CrawlerLogFolderTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let logs = ["d1/","d2/","./","d3/","../","d31/"]
        
        let result = CrawlerLogFolder().minOperations(logs)
        
        #expect(result == 3)
    }
    
    @Test
    func test_B() {
        let logs = ["d1/","../","../","../"]
        
        let result = CrawlerLogFolder().minOperations(logs)
        
        #expect(result == 0)
    }
}
