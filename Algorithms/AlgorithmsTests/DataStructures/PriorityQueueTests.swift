// Created 23/05/2022.

import XCTest

@testable import Algorithms

final class PriorityQueueTests: XCTestCase {

    // MARK: - Tests
    
    // MARK: isEmpty
    
    func test_isEmpty_noElementsAdded() {
        let queue = PriorityQueue<Int> { $0 > $1 }
        
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_isEmpty_elementsAdded() {
        let queue = PriorityQueue(elements: [1, 2, 3]) { $0 > $1 }
        
        XCTAssertFalse(queue.isEmpty)
    }
    
    // MARK: Peek
    
    func test_peek_empty() {
        let queue = PriorityQueue<Int> { $0 > $1 }
        
        XCTAssertNil(queue.peek)
    }
    
    func test_peek_max_notEmpty() {
        let queue = PriorityQueue(elements: [1, 3, 2]) { $0 > $1 }
        
        XCTAssertNotNil(queue.peek)
        XCTAssertEqual(queue.peek, 3)
    }
    
    func test_peek_min_notEmpty() {
        let queue = PriorityQueue(elements: [2, 1, 3]) { $0 < $1 }
        
        XCTAssertNotNil(queue.peek)
        XCTAssertEqual(queue.peek, 1)
    }
    
    // MARK: Enqueue
    
    func test_enqueue_max_empty() {
        var queue = PriorityQueue<Int> { $0 > $1 }
        
        XCTAssertNil(queue.peek)
        
        queue.enqueue(5)
        
        XCTAssertEqual(queue.peek, 5)
    }
    
    func test_enqueue_max_notEmpty() {
        var queue = PriorityQueue(elements: [1, 3, 2]) { $0 > $1 }
        
        XCTAssertEqual(queue.peek, 3)
        
        queue.enqueue(5)
        
        XCTAssertEqual(queue.peek, 5)
    }
    
    // MARK: Dequeue
    
    func test_dequeue_max_empty() {
        var queue = PriorityQueue<Int> { $0 > $1 }
        
        XCTAssertNil(queue.dequeue())
    }
    
    func test_dequeue_max_notEmpty() {
        var queue = PriorityQueue(elements: [1, 3, 2]) { $0 > $1 }
        
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertEqual(queue.peek, 2)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertNil(queue.dequeue())
    }
}
