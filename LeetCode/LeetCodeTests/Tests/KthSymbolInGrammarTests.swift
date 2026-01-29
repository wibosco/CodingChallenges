// Created 21/12/2021.

import XCTest

@testable import LeetCode

final class KthSymbolInGrammarTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 1
        let k = 1
        
        let result = KthSymbolInGrammar().kthGrammar(n, k)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_B() {
        let n = 2
        let k = 1
        
        let result = KthSymbolInGrammar().kthGrammar(n, k)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let n = 2
        let k = 2
        
        let result = KthSymbolInGrammar().kthGrammar(n, k)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_D() {
        let n = 3
        let k = 1
        
        let result = KthSymbolInGrammar().kthGrammar(n, k)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_E() {
        let n = 4
        let k = 5
        
        let result = KthSymbolInGrammar().kthGrammar(n, k)
        
        XCTAssertEqual(result, 1)
    }
}
