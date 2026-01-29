// Created 10/07/2023.

import XCTest

@testable import LeetCode

final class UniqueLength3PalindromicSubsequencesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "aabca"
        
        let result = UniqueLength3PalindromicSubsequences().countPalindromicSubsequence(s)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let s = "adc"
        
        let result = UniqueLength3PalindromicSubsequences().countPalindromicSubsequence(s)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let s = "bbcbaba"
        
        let result = UniqueLength3PalindromicSubsequences().countPalindromicSubsequence(s)
        
        XCTAssertEqual(result, 4)
    }
}
