//
//  HeapSortTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 27/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class HeapSortTests: XCTestCase {

    // MARK: Tests
    
    func test_MaxHeapSortA() {
        
        let input = [6,5,1,7,14,9]
        let expectedOutput = [1,5,6,7,9,14]
        
        let actualOutput = HeapSort.maxHeapSort(input)
        
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}
