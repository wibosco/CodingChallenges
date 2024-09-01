//
//  AssignCookiesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 01/09/2024.
//

import XCTest

@testable import LeetCode

final class AssignCookiesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let g = [1,2,3]
        let s = [1,1]
            
        let result = AssignCookies().findContentChildren(g, s)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_B() {
        let g = [1,2]
        let s = [1,2,3]
            
        let result = AssignCookies().findContentChildren(g, s)
        
        XCTAssertEqual(result, 2)
    }
}
