//
//  UniqueEmailAddressesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/07/2023.
//

import XCTest

@testable import LeetCode

final class UniqueEmailAddressesTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let emails = ["test.email+alex@leetcode.com", "test.e.mail+bob.cathy@leetcode.com", "testemail+david@lee.tcode.com"]
        
        let result = UniqueEmailAddresses().numUniqueEmails(emails)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let emails = ["a@leetcode.com", "b@leetcode.com", "c@leetcode.com"]
        
        let result = UniqueEmailAddresses().numUniqueEmails(emails)
        
        XCTAssertEqual(result, 3)
    }
}
