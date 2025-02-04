//
//  MaximumProductOfTheLengthOfTwoPalindromicSubsequencesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/07/2023.
//

import XCTest

@testable import LeetCode

final class MaximumProductOfTheLengthOfTwoPalindromicSubsequencesTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let s = "leetcodecom"
        
        let result = MaximumProductOfTheLengthOfTwoPalindromicSubsequences().maxProduct(s)
        
        XCTAssertEqual(result, 9)
    }
    
    func test_B() {
        let s = "bb"
        
        let result = MaximumProductOfTheLengthOfTwoPalindromicSubsequences().maxProduct(s)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let s = "accbcaxxcxx"
        
        let result = MaximumProductOfTheLengthOfTwoPalindromicSubsequences().maxProduct(s)
        
        XCTAssertEqual(result, 25)
    }
}
