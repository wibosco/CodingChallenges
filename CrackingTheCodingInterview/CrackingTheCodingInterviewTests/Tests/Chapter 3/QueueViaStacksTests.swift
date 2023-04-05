//
//  QueueViaStacksTests.swift
//  CrackingTheCodingInterviewTests
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CrackingTheCodingInterview

final class QueueViaStacksTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let values = [3, 5, 6, 7, 8, 9, 2, 3, 5, 8]
        
        let queue = QueueViaStacks()
        
        for value in values {
            queue.enqueue(value: value)
        }
        
        XCTAssertEqual(3, queue.peek())
    }
}
