//
//  StackOfPlatesTests.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CrackingTheCodingInterview

class StackOfPlatesTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let stacksOfPlates = StackOfPlates()
        
        stacksOfPlates.push(value: 1)
        stacksOfPlates.push(value: 2)
        
        XCTAssertEqual(1, stacksOfPlates.stacks.count)
    }
    
    func test_B() {
        
        let stacksOfPlates = StackOfPlates()
        
        stacksOfPlates.push(value: 1)
        stacksOfPlates.push(value: 2)
        stacksOfPlates.push(value: 3)
        
        XCTAssertEqual(2, stacksOfPlates.stacks.count)
    }
    
    func test_C() {
        
        let stacksOfPlates = StackOfPlates()
        
        stacksOfPlates.push(value: 1)
        stacksOfPlates.push(value: 2)
        stacksOfPlates.push(value: 3)
        
        _ = stacksOfPlates.pop()
        
        XCTAssertEqual(1, stacksOfPlates.stacks.count)
    }
    
}
