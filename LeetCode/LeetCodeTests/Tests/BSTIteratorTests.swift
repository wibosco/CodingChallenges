//
//  BSTIteratorTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/03/2022.
//

import XCTest

@testable import LeetCode

class BSTIteratorTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [7, 3, 15, nil, nil, 9, 20]
        let root = BinaryTreeNode.deserialize(data)
        let iterator = BSTIterator(root)
        
        XCTAssertEqual(iterator.next(), 3)
        XCTAssertEqual(iterator.next(), 7)
        XCTAssertTrue(iterator.hasNext())
        XCTAssertEqual(iterator.next(), 9)
        XCTAssertTrue(iterator.hasNext())
        XCTAssertEqual(iterator.next(), 15)
        XCTAssertTrue(iterator.hasNext())
        XCTAssertEqual(iterator.next(), 20)
        XCTAssertFalse(iterator.hasNext())
    }
}
