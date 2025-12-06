// Created 01/06/2016.


import XCTest

@testable import CrackingTheCodingInterview

final class StackOfPlatesTests: XCTestCase {
    
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
