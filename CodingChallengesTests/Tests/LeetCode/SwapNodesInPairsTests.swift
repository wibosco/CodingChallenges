//
//  SwapNodesInPairsTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 16/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class SwapNodesInPairsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let data = [1, 2, 3, 4]
        
        let head = ListNode.deserialize(data)
        
        let rotatedHead = SwapNodesInPairs.swapPairs(head)
        
        let values = ListNode.extractValues(fromList: rotatedHead)
        
        XCTAssertEqual(values, [2, 1, 4, 3])
    }
    
    func test_B() {
        let data = [Int]()
        
        let head = ListNode.deserialize(data)
        
        let rotatedHead = SwapNodesInPairs.swapPairs(head)
        
        let values = ListNode.extractValues(fromList: rotatedHead)
        
        XCTAssertEqual(values, [])
    }
    
    func test_C() {
        let data = [1]
        
        let head = ListNode.deserialize(data)
        
        let rotatedHead = SwapNodesInPairs.swapPairs(head)
        
        let values = ListNode.extractValues(fromList: rotatedHead)
        
        XCTAssertEqual(values, [1])
    }

}
