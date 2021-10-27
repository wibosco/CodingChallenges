//
//  MinHeapTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import WhiteBoardCodingChallenges

class MinHeapTests: XCTestCase {

    // MARK: Tests
    
    func test_minHeapA() {
        
        let input = [3,5,6,7,8,9,12,15,4,1]
        
        let heap = MinHeap.buildMinHeap(input: input)
        
        XCTAssertEqual(heap[0], 1)
    }
    
    func test_minHeapB() {
        
        let input = [3,17,4]
        
        let heap = MinHeap.buildMinHeap(input: input)
        
        XCTAssertEqual(heap[0], 3)
    }
}
