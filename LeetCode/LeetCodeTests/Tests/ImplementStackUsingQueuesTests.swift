//
//  ImplementStackUsingQueuesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 05/05/2022.
//

import XCTest

@testable import LeetCode

final class ImplementStackUsingQueuesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let stack = ImplementStackUsingQueues()
        
        stack.push(1)
        stack.push(2)
        
        XCTAssertEqual(stack.top(), 2)
        XCTAssertEqual(stack.pop(), 2)
        
        XCTAssertFalse(stack.empty())
    }
    
    func test_B() {
        let stack = ImplementStackUsingQueues()

        stack.push(1)
        stack.push(2)
        
        XCTAssertEqual(stack.top(), 2)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 1)
        
        XCTAssertTrue(stack.empty())
    }
}
