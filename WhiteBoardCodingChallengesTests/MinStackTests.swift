//
//  MinStackTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class MinStackTests: XCTestCase {
    
    // MARK: Tests
    
    func test_minStackPush_lowestTail() {
        
        let stackValues = [1, 2, 3, 4, 5]
        
        let stack = MinStack()
        
        for value in stackValues {
            
            stack.push(value: value)
        }
        
        XCTAssertEqual(1, stack.min()!.lowerNodeMinNode!.value)
    }
    
    func test_minStackPush_lowestHead() {
        
        let stackValues = [5, 4, 3, 2, 1]
        
        let stack = MinStack()
        
        for value in stackValues {
            
            stack.push(value: value)
        }
        
        XCTAssertEqual(1, stack.min()!.lowerNodeMinNode!.value)
    }
    
    func test_minStackPush_lowestInCenter() {
        
        let stackValues = [5, 4, 1, 3, 2]
        
        let stack = MinStack()
        
        for value in stackValues {
            
            stack.push(value: value)
        }
        
        XCTAssertEqual(1, stack.min()!.lowerNodeMinNode!.value)
    }
    
    func test_minStackPush_lowestDuplicate() {
        
        let stackValues = [5, 4, 1, 3, 2, 1]
        
        let stack = MinStack()
        
        for value in stackValues {
            
            stack.push(value: value)
        }
        
        XCTAssertEqual(1, stack.min()!.lowerNodeMinNode!.value)
    }
    
    func test_minStackPop_lowestHeadRemoved() {
        
        let stackValues = [5, 4, 3, 2, 1]
        
        let stack = MinStack()
        
        for value in stackValues {
            
            stack.push(value: value)
        }
        
        _ = stack.pop()
        
        XCTAssertEqual(2, stack.min()!.lowerNodeMinNode!.value)
    }
    
    func test_minStackPop_lowestHeadRemovedWithOutOfOrderNodes() {
        
        let stackValues = [5, 4, 2, 3, 7, 1]
        
        let stack = MinStack()
        
        for value in stackValues {
            
            stack.push(value: value)
        }
        
        _ = stack.pop()
        
        XCTAssertEqual(2, stack.min()!.lowerNodeMinNode!.value)
    }
    
    func test_minStackPop_lowestHeadRemovedWithDuplicateValue() {
        
        let stackValues = [1, 5, 4, 2, 3, 7, 1]
        
        let stack = MinStack()
        
        for value in stackValues {
            
            stack.push(value: value)
        }
        
        _ = stack.pop()
        
        XCTAssertEqual(1, stack.min()!.lowerNodeMinNode!.value)
    }
    
}
