// Created 13/12/2021.

import XCTest

@testable import LeetCode

final class OpenTheLockTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let deadends = ["0201",
                        "0101",
                        "0102",
                        "1212",
                        "2002"]
        let target = "0202"
        
        let result = OpenTheLock().openLock(deadends, target)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_B() {
        let deadends = ["8888"]
        let target = "0009"
        
        let result = OpenTheLock().openLock(deadends, target)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let deadends = ["8887", "8889", "8878", "8898", "8788", "8988", "7888", "9888"]
        let target = "8888"
        
        let result = OpenTheLock().openLock(deadends, target)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_D() {
        let deadends = ["0000"]
        let target = "8888"
        
        let result = OpenTheLock().openLock(deadends, target)
        
        XCTAssertEqual(result, -1)
    }
}
