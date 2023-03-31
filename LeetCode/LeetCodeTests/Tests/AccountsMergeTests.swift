//
//  AccountsMergeTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 08/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class AccountsMergeTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let accounts = [["John", "johnsmith@mail.com", "john_newyork@mail.com"],
                        ["John", "johnsmith@mail.com", "john00@mail.com"],
                        ["Mary", "mary@mail.com"],
                        ["John", "johnnybravo@mail.com"]]
        
        let merged = AccountsMerge.accountsMerge(accounts)
        
        XCTAssertEqual(merged, [["John", "john00@mail.com", "john_newyork@mail.com", "johnsmith@mail.com"],
                                ["Mary", "mary@mail.com"],
                                ["John", "johnnybravo@mail.com"]])
    }
    
    func test_B() {
        let accounts = [["Gabe", "Gabe0@m.co", "Gabe3@m.co", "Gabe1@m.co"],
                        ["Kevin", "Kevin3@m.co", "Kevin5@m.co", "Kevin0@m.co"],
                        ["Ethan", "Ethan5@m.co", "Ethan4@m.co", "Ethan0@m.co"],
                        ["Hanzo", "Hanzo3@m.co", "Hanzo1@m.co", "Hanzo0@m.co"],
                        ["Fern", "Fern5@m.co", "Fern1@m.co", "Fern0@m.co"]]
        
        let merged = AccountsMerge.accountsMerge(accounts)
        
        XCTAssertEqual(merged, [["Gabe", "Gabe0@m.co", "Gabe1@m.co", "Gabe3@m.co"],
                                ["Kevin", "Kevin0@m.co", "Kevin3@m.co", "Kevin5@m.co"],
                                ["Ethan", "Ethan0@m.co", "Ethan4@m.co", "Ethan5@m.co"],
                                ["Hanzo", "Hanzo0@m.co", "Hanzo1@m.co", "Hanzo3@m.co"],
                                ["Fern", "Fern0@m.co", "Fern1@m.co", "Fern5@m.co"]])
    }
}
