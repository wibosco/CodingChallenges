//
//  PalindromeLinkedListTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 02/08/2023.
//

import XCTest

@testable import LeetCode

final class PalindromeLinkedListTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 2, 1]
        let head = ListNode.deserialize(data)
            
        let result = PalindromeLinkedList.isPalindrome(head)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let data = [1, 2]
        let head = ListNode.deserialize(data)
            
        let result = PalindromeLinkedList.isPalindrome(head)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let data = [1, 2, 3, 2, 1]
        let head = ListNode.deserialize(data)
            
        let result = PalindromeLinkedList.isPalindrome(head)
        
        XCTAssertTrue(result)
    }
    
    func test_D() {
        let data = [1, 2, 1]
        let head = ListNode.deserialize(data)
            
        let result = PalindromeLinkedList.isPalindrome(head)
        
        XCTAssertTrue(result)
    }
    
    func test_E() {
        let data = [1]
        let head = ListNode.deserialize(data)
            
        let result = PalindromeLinkedList.isPalindrome(head)
        
        XCTAssertTrue(result)
    }
}
