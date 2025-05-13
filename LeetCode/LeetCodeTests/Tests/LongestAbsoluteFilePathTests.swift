// Created 13/05/2025.

import Testing

@testable import LeetCode

struct LongestAbsoluteFilePathTests {

    // MARK: - Tests
    
    @Test
    func test_A() {
        let input = "dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext"
        
        let result = LongestAbsoluteFilePath().lengthLongestPath(input)
        
        #expect(result == 20)
    }
    
    @Test
    func test_B() {
        let input = "dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext"
        
        let result = LongestAbsoluteFilePath().lengthLongestPath(input)
        
        #expect(result == 32)
    }
    
    @Test
    func test_C() {
        let input = "a"
        
        let result = LongestAbsoluteFilePath().lengthLongestPath(input)
        
        #expect(result == 0)
    }
    
    @Test
    func test_D() {
        let input = "a.txt"
        
        let result = LongestAbsoluteFilePath().lengthLongestPath(input)
        
        #expect(result == 5)
    }
}
