//
//  HeapTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 22/05/2022.
//

import XCTest

@testable import Algorithms

class HeapTests: XCTestCase {

    // MARK: - Tests
    
    func test_minHeap_A() {
        let data = [5, 1, 3, 2]
        
        var minHeap = Heap(elements: data) { $0 < $1 }
        
        XCTAssertEqual(minHeap.dequeue(), 1)
        XCTAssertEqual(minHeap.peek(), 2)
        XCTAssertEqual(minHeap.dequeue(), 2)
        XCTAssertEqual(minHeap.peek(), 3)
        XCTAssertEqual(minHeap.count, 2)
        XCTAssertFalse(minHeap.isEmpty)
        XCTAssertEqual(minHeap.dequeue(), 3)
        XCTAssertEqual(minHeap.dequeue(), 5)
        XCTAssertTrue(minHeap.isEmpty)
    }
    
    func test_minHeap_B() {
        let data = [5, 1, 3, -2]
        
        var minHeap = Heap(elements: data) { $0 < $1 }
        
        XCTAssertEqual(minHeap.peek(), -2)
        XCTAssertEqual(minHeap.dequeue(), -2)
    }
    
    func test_maxHeap_B() {
        let data = [5, 1, 3, 2]
        
        var minHeap = Heap(elements: data) { $0 > $1 }
        
        XCTAssertEqual(minHeap.dequeue(), 5)
        XCTAssertEqual(minHeap.peek(), 3)
        XCTAssertEqual(minHeap.dequeue(), 3)
        XCTAssertEqual(minHeap.peek(), 2)
        XCTAssertEqual(minHeap.count, 2)
        XCTAssertFalse(minHeap.isEmpty)
        XCTAssertEqual(minHeap.dequeue(), 2)
        XCTAssertEqual(minHeap.dequeue(), 1)
        XCTAssertTrue(minHeap.isEmpty)
    }
}
