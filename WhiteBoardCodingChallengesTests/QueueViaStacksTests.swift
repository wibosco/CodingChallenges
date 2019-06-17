//
//  QueueViaStacksTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class QueueViaStacksTests: XCTestCase {
    
    // MARK: Tests
    
    func test_queueViaStacks() {
        
        let values = [3,5,6,7,8,9,2,3,5,8]
        
        let queue = QueueViaStacks()
        
        for value in values {
            
            queue.enqueue(value: value)
        }
        
        XCTAssertEqual(3, queue.peek())
        
    }
}
