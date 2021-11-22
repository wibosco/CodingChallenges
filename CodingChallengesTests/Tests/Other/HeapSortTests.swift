//
//  HeapSortTests.swift
//  CodingChallenges
//
//  Created by William Boles on 27/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class HeapSortTests: XCTestCase {

    // MARK: MaxTests
    
    func test_maxHeapSortA() {
        
        let input = [6,5,1,7,14,9]
        let expectedOutput = [1,5,6,7,9,14]
        
        let actualOutput = HeapSort.maxHeapSort(input: input)
        
        XCTAssertEqual(actualOutput, expectedOutput)
    }
    
    // MARK: MinTests
    
    func test_minHeapSortA() {
        
        let input = [6,5,1,7,14,9]
        let expectedOutput = [14,9,7,6,5,1]
        
        let actualOutput = HeapSort.minHeapSort(input: input)
        
        XCTAssertEqual(actualOutput, expectedOutput)
    }
}
