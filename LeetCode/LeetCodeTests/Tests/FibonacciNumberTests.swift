// Created 21/12/2021.


import XCTest

@testable import LeetCode

final class FibonacciNumberTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 2
        
        let result = FibonacciNumber().fib(n)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let n = 3
        
        let result = FibonacciNumber().fib(n)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let n = 4
        
        let result = FibonacciNumber().fib(n)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_D() {
        let n = 0
        
        let result = FibonacciNumber().fib(n)
        
        XCTAssertEqual(result, 0)
    }
}
