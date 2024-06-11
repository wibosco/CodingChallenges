//
//  ReverseOnlyLettersTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/06/2024.
//

import XCTest

@testable import LeetCode

final class ReverseOnlyLettersTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "ab-cd"
        
        let result = ReverseOnlyLetters().reverseOnlyLetters(s)
        
        XCTAssertEqual(result, "dc-ba")
    }
    
    func test_B() {
        let s = "a-bC-dEf-ghIj"
        
        let result = ReverseOnlyLetters().reverseOnlyLetters(s)
        
        XCTAssertEqual(result, "j-Ih-gfE-dCba")
    }
    
    func test_C() {
        let s = "Test1ng-Leet=code-Q!"
        
        let result = ReverseOnlyLetters().reverseOnlyLetters(s)
        
        XCTAssertEqual(result, "Qedo1ct-eeLg=ntse-T!")
    }
}
