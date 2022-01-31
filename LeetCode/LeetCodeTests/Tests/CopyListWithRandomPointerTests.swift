//
//  CopyListWithRandomPointerTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class CopyListWithRandomPointerTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let list = ListNodeRandom.deserialize([[7, nil], [13, 0], [11, 4], [10, 2], [1, 0]])
        
        let copy = CopyListWithRandomPointer.copyRandomList(list)
        
        let values = ListNodeRandom.extractValues(fromList: copy)
        
        XCTAssertEqual(values, [[7, nil], [13, 0], [11, 4], [10, 2], [1, 0]])
    }
    
    func test_B() {
        let list = ListNodeRandom.deserialize([[1, 1],[2, 1]])
        
        let copy = CopyListWithRandomPointer.copyRandomList(list)
        
        let values = ListNodeRandom.extractValues(fromList: copy)
        
        XCTAssertEqual(values, [[1, 1], [2, 1]])
    }
    
    func test_C() {
        let list = ListNodeRandom.deserialize([[3, nil], [3, 0], [3, nil]])
        
        let copy = CopyListWithRandomPointer.copyRandomList(list)
        
        let values = ListNodeRandom.extractValues(fromList: copy)
        
        XCTAssertEqual(values, [[3, nil], [3, 0], [3, nil]])
    }
    
    func test_D() {
        let list = ListNodeRandom.deserialize([])
        
        let copy = CopyListWithRandomPointer.copyRandomList(list)
        
        let values = ListNodeRandom.extractValues(fromList: copy)
        
        XCTAssertEqual(values, [])
    }

}
