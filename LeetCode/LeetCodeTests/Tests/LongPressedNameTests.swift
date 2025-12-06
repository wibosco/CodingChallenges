// Created 02/09/2024.


import XCTest

@testable import LeetCode

final class LongPressedNameTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let name = "alex"
        let typed = "aaleex"
            
        let result = LongPressedName().isLongPressedName(name, typed)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let name = "saeed"
        let typed = "ssaaedd"
            
        let result = LongPressedName().isLongPressedName(name, typed)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let name = "q"
        let typed = "b"
            
        let result = LongPressedName().isLongPressedName(name, typed)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let name = "a"
        let typed = "ab"
            
        let result = LongPressedName().isLongPressedName(name, typed)
        
        XCTAssertFalse(result)
    }
    
    func test_E() {
        let name = "vtkgn"
        let typed = "vttkgnn"
            
        let result = LongPressedName().isLongPressedName(name, typed)
        
        XCTAssertTrue(result)
    }
}
