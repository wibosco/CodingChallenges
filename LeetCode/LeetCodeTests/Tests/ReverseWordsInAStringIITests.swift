//
//  ReverseWordsInAStringIITests.swift
//  LeetCodeTests
//
//  Created by William Boles on 04/09/2024.
//

import XCTest

@testable import LeetCode

final class ReverseWordsInAStringIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var s: [Character] = ["t","h","e"," ","s","k","y"," ","i","s"," ","b","l","u","e"]
        
       ReverseWordsInAStringII().reverseWords(&s)
        
        XCTAssertEqual(s, ["b","l","u","e"," ","i","s"," ","s","k","y"," ","t","h","e"])
    }
    
    func test_B() {
        var s: [Character] = ["a"]
        
       ReverseWordsInAStringII().reverseWords(&s)
        
        XCTAssertEqual(s, ["a"])
    }
}
