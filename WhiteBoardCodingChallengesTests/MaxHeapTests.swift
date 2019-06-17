//
//  MaxHeapTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 27/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class MaxHeapTests: XCTestCase {

    // MARK: Tests
    
    func test_maxHeapA() {
        
        let input = [3,5,6,7,8,9,12,15,4,1]
        
        let heap = MaxHeap.buildMaxHeap(input: input)
        
        XCTAssertEqual(heap[0], 15)
    }
    
    func test_maxHeapB() {
        
        let input = [3,17,4]
        
        let heap = MaxHeap.buildMaxHeap(input: input)
        
        XCTAssertEqual(heap[0], 17)
    }
}
