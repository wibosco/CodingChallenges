// Created 16/03/2022.

import XCTest

@testable import LeetCode

final class UniquePathsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let m = 3
        let n = 7
        
        let result = UniquePaths().uniquePaths(m, n)
        
        XCTAssertEqual(result, 28)
    }
    
    func test_B() {
        let m = 3
        let n = 2
        
        let result = UniquePaths().uniquePaths(m, n)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let m = 19
        let n = 13
        
        let result = UniquePaths().uniquePaths(m, n)
        
        XCTAssertEqual(result, 86493225)
    }
}
