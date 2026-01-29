// Created 17/12/2021.

import XCTest

@testable import LeetCode

final class CustomSortStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let order = "cba"
        let s = "abcd"
        
        let result = CustomSortString().customSortString(order, s)
        
        XCTAssertEqual(result, "cbad")
    }
    
    func test_B() {
        let order = "cbafg"
        let s = "abcd"
        
        let result = CustomSortString().customSortString(order, s)
        
        XCTAssertEqual(result, "cbad")
    }
    
    func test_C() {
        let order =  "kqep"
        let s = "pekeq"
        
        let result = CustomSortString().customSortString(order, s)
        
        XCTAssertEqual(result, "kqeep")
    }
    
    func test_D() {
        let order =  "hucw"
        let s = "thutcwt"
        
        let result = CustomSortString().customSortString(order, s)
        
        XCTAssertEqual(result, "hucwttt")
    }

}
