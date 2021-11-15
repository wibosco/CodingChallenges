//
//  CopyListWithRandomPointerTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class CopyListWithRandomPointerTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let list = Node.createList(fromArray: [[7, nil], [13, 0], [11, 4], [10, 2], [1, 0]])
        
        let copy = CopyListWithRandomPointer.copyRandomList(list)
        
        let values = Node.extractValues(fromList: copy)
        
        XCTAssertEqual(values, [[7, nil], [13, 0], [11, 4], [10, 2], [1, 0]])
    }
    
    func test_B() {
        let list = Node.createList(fromArray: [[1, 1],[2, 1]])
        
        let copy = CopyListWithRandomPointer.copyRandomList(list)
        
        let values = Node.extractValues(fromList: copy)
        
        XCTAssertEqual(values, [[1, 1], [2, 1]])
    }
    
    func test_C() {
        let list = Node.createList(fromArray: [[3, nil], [3, 0], [3, nil]])
        
        let copy = CopyListWithRandomPointer.copyRandomList(list)
        
        let values = Node.extractValues(fromList: copy)
        
        XCTAssertEqual(values, [[3, nil], [3, 0], [3, nil]])
    }
    
    func test_D() {
        let list = Node.createList(fromArray: [])
        
        let copy = CopyListWithRandomPointer.copyRandomList(list)
        
        let values = Node.extractValues(fromList: copy)
        
        XCTAssertEqual(values, [])
    }

}
