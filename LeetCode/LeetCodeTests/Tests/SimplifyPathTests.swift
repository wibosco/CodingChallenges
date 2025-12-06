// Created 15/11/2021.


import XCTest

@testable import LeetCode

final class SimplifyPathTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let path = "/home/"
        
        let result = SimplifyPath().simplifyPath(path)
        
        XCTAssertEqual(result, "/home")
    }
    
    func test_B() {
        let path = "/../"
        
        let result = SimplifyPath().simplifyPath(path)
        
        XCTAssertEqual(result, "/")
    }
    
    func test_C() {
        let path = "/home//foo/"
        
        let result = SimplifyPath().simplifyPath(path)
        
        XCTAssertEqual(result, "/home/foo")
    }
    
    func test_D() {
        let path = "/a/./b/../../c/"
        
        let result = SimplifyPath().simplifyPath(path)
        
        XCTAssertEqual(result, "/c")
    }
}
