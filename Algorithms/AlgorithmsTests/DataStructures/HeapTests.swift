//
//  HeapTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 22/05/2022.
//

import XCTest

@testable import Algorithms

final class HeapTests: XCTestCase {

    // MARK: - Tests
    
    func test_minHeap_A() {
        let data = [5, 1, 3, 2]
        
        var minHeap = Heap(elements: data) { $0 < $1 }
        
        XCTAssertEqual(minHeap.remove(), 1)
        XCTAssertEqual(minHeap.peek(), 2)
        XCTAssertEqual(minHeap.remove(), 2)
        XCTAssertEqual(minHeap.peek(), 3)
        XCTAssertEqual(minHeap.count, 2)
        XCTAssertFalse(minHeap.isEmpty)
        XCTAssertEqual(minHeap.remove(), 3)
        XCTAssertEqual(minHeap.remove(), 5)
        XCTAssertTrue(minHeap.isEmpty)
    }
    
    func test_minHeap_B() {
        let data = [5, 1, 3, -2]
        
        var minHeap = Heap(elements: data) { $0 < $1 }
        
        XCTAssertEqual(minHeap.peek(), -2)
        XCTAssertEqual(minHeap.remove(), -2)
    }
    
    func test_maxHeap_A() {
        let data = [5, 1, 3, 2]
        
        var minHeap = Heap(elements: data) { $0 > $1 }
        
        XCTAssertEqual(minHeap.remove(), 5)
        XCTAssertEqual(minHeap.peek(), 3)
        XCTAssertEqual(minHeap.remove(), 3)
        XCTAssertEqual(minHeap.peek(), 2)
        XCTAssertEqual(minHeap.count, 2)
        XCTAssertFalse(minHeap.isEmpty)
        XCTAssertEqual(minHeap.remove(), 2)
        XCTAssertEqual(minHeap.remove(), 1)
        XCTAssertTrue(minHeap.isEmpty)
    }
}
