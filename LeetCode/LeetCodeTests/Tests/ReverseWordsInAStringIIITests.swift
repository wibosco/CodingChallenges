//
//  ReverseWordsInAStringIIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/03/2024.
//

import XCTest

@testable import LeetCode

final class ReverseWordsInAStringIIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "Let's take LeetCode contest"
        
        let result = ReverseWordsInAStringIII().reverseWords(s)
        
        XCTAssertEqual(result, "s'teL ekat edoCteeL tsetnoc")
    }
    
    func test_B() {
        let s = "Mr Ding"
        
        let result = ReverseWordsInAStringIII().reverseWords(s)
        
        XCTAssertEqual(result, "rM gniD")
    }
}
